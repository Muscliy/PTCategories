//
//  NSTimer+PTBlock.h
//  PTCategories
//
//  Created by LeeHu on 8/23/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NSTimerCallBack)(void);
typedef void (^NSTimerInterruptCallBack)(BOOL *stop);

@interface NSTimer (PTBlock)


/**
 Create and reutrn a new NSTimer object and can contrl scheduled repeats
 
 @param seconds     The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead
 @param repeats     If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
 @param block       the block invoke when the timer fires.
 @return a new NSTimer object, property acrroding to the specified by parameters
 */
+ (NSTimer *)pt_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                       repeats:(BOOL)repeats
                                  blockHandler:(NSTimerCallBack)block;


/**
 Create and reutrn a new NSTimer and schedules it on the current run loop in the default mode
 
 @param seconds The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead
 @param block the block invoke when the timer fires. the parameter stop can control timer invalidate
 @return a new NSTimer object, property acrroding to the specified by parameters
 */
+ (NSTimer *)pt_scheduledInterruptTimerWithTimeInterval:(NSTimeInterval)seconds
                                           blockHandler:(NSTimerInterruptCallBack)block;

@end
