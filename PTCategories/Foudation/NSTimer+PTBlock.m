//
//  NSTimer+PTBlock.m
//  PTCategories
//
//  Created by LeeHu on 8/23/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import "NSTimer+PTBlock.h"

@interface NSTimerBlockHandle : NSObject

@property (nonatomic, copy) id block;

- (void)pt_handleTimerBlock:(NSTimer *)timer;
- (void)pt_handleTimerInterruptBlock:(NSTimer *)timer;

@end

@implementation NSTimerBlockHandle

- (void)pt_handleTimerBlock:(NSTimer *)timer
{
    NSTimerCallBack callbackBlock = self.block;
    if (callbackBlock) {
        callbackBlock();
    }
}

- (void)pt_handleTimerInterruptBlock:(NSTimer *)timer
{
    NSTimerInterruptCallBack interruptCallbackBlock = self.block;
    BOOL stop = NO;
    if (interruptCallbackBlock) {
        interruptCallbackBlock(&stop);
    }
    
    if (stop) {
        [timer invalidate];
        timer = nil;
    }
}

@end

@implementation NSTimer (PTBlock)

+ (NSTimer *)pt_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                       repeats:(BOOL)repeats
                                  blockHandler:(NSTimerCallBack)block
{
    NSTimerBlockHandle *blockHandle = [[NSTimerBlockHandle alloc] init];
    blockHandle.block = block;
    return [self scheduledTimerWithTimeInterval:seconds
                                         target:blockHandle
                                       selector:@selector(pt_handleTimerBlock:)
                                       userInfo:nil
                                        repeats:repeats];
}

+ (NSTimer *)pt_scheduledInterruptTimerWithTimeInterval:(NSTimeInterval)seconds
                                           blockHandler:(NSTimerInterruptCallBack)block
{
    NSTimerBlockHandle *blockHandle = [[NSTimerBlockHandle alloc] init];
    blockHandle.block = block;
    return [self scheduledTimerWithTimeInterval:seconds
                                         target:blockHandle
                                       selector:@selector(pt_handleTimerInterruptBlock:)
                                       userInfo:nil
                                        repeats:YES];
}

@end
