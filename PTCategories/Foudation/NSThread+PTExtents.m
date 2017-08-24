//
//  NSThread+PTExtents.m
//  PTCategories
//
//  Created by LeeHu on 8/24/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import "NSThread+PTExtents.h"
#import <CoreFoundation/CoreFoundation.h>

static NSString *const PTNSThreadAutoleasePoolKey = @"PTNSThreadAutoleasePoolKey";
static NSString *const PTSThreadAutoleasePoolStackKey = @"PTSThreadAutoleasePoolStackKey";

static const void *PoolStackRetainCallBack(CFAllocatorRef allocator, const void *value) {
    return value;
}

static void PoolStackReleaseCallBack(CFAllocatorRef allocator, const void *value) {
    CFRelease((CFTypeRef)value);
}


static inline void AutoreleasePoolPush() NS_AUTOMATED_REFCOUNT_UNAVAILABLE {
    NSMutableDictionary *dic =  [NSThread currentThread].threadDictionary;
    NSMutableArray *poolStack = dic[PTSThreadAutoleasePoolStackKey];
    
    if (!poolStack) {
        CFArrayCallBacks callbacks = {0};
        callbacks.retain = PoolStackRetainCallBack;
        callbacks.release = PoolStackReleaseCallBack;
        poolStack = (id)CFBridgingRelease(CFArrayCreateMutable(CFAllocatorGetDefault(), 0, &callbacks));
        dic[PTSThreadAutoleasePoolStackKey] = poolStack;
        CFRelease((__bridge CFTypeRef)(poolStack));
    }
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [poolStack addObject:pool];
}

static inline void AutoreleasePoolPop() {
    NSMutableDictionary *dic =  [NSThread currentThread].threadDictionary;
    NSMutableArray *poolStack = dic[PTSThreadAutoleasePoolStackKey];
    [poolStack removeLastObject];
}

static void RunLoopAutoreleasePoolObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) NS_AUTOMATED_REFCOUNT_UNAVAILABLE {
    switch (activity) {
        case kCFRunLoopEntry: {
            AutoreleasePoolPush();
        } break;
        case kCFRunLoopBeforeWaiting: {
            AutoreleasePoolPop();
            AutoreleasePoolPush();
        } break;
        case kCFRunLoopExit: {
            AutoreleasePoolPop();
        } break;
        default: break;
    }
}

static void RunloopAutoreleasePoolSetup() NS_AUTOMATED_REFCOUNT_UNAVAILABLE{
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    
    CFRunLoopObserverRef pushObserver;
    pushObserver = CFRunLoopObserverCreate(CFAllocatorGetDefault(),
                                           kCFRunLoopEntry,
                                           true,
                                           -0x7FFFFFFF,
                                           RunLoopAutoreleasePoolObserverCallBack,
                                           NULL);
    CFRunLoopAddObserver(runloop, pushObserver, kCFRunLoopCommonModes);
    CFRelease(pushObserver);
    
    CFRunLoopObserverRef popObserver;
    popObserver = CFRunLoopObserverCreate(CFAllocatorGetDefault(),
                                          kCFRunLoopBeforeWaiting | kCFRunLoopExit,
                                          true,
                                          0x7FFFFFFF,
                                          RunLoopAutoreleasePoolObserverCallBack,
                                          NULL);
    CFRunLoopAddObserver(runloop, popObserver, kCFRunLoopCommonModes);
    CFRelease(popObserver);
}



@implementation NSThread (PTExtents)

+ (void)pt_addAutoreleasePoolToCurrentRunloop NS_AUTOMATED_REFCOUNT_UNAVAILABLE {
    if ([NSThread isMainThread]) return;
    NSThread *thread = [self currentThread];
    if (!thread) return;
    if (thread.threadDictionary[PTNSThreadAutoleasePoolKey]) return;
    RunloopAutoreleasePoolSetup();
    thread.threadDictionary[PTNSThreadAutoleasePoolKey] = PTNSThreadAutoleasePoolKey;
}

@end
