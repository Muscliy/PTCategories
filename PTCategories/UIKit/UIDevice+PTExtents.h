//
//  UIDevice+PTExtents.h
//  PTCategories
//
//  Created by LeeHu on 8/24/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (PTExtents)

#pragma mark - device infomation

+ (double)pt_systemVersion;

- (BOOL) pt_isPad;

- (BOOL) pt_isSimulator;

- (BOOL) pt_isJailbroken;

- (NSString *) pt_model;

- (NSString *) pt_name;

- (NSDate *) pt_systemUpdateTime;


#pragma mark - disk infomation
- (int64_t) pt_diskSpace;

- (int64_t) pt_diskSpaceFree;

- (int64_t) pt_diskSpaceUsed;

#pragma mark - Memory Information

- (int64_t) pt_memoryTotal;

- (int64_t) pt_memoryUsed;

- (int64_t) pt_memoryFree;

- (int64_t) pt_memoryActive;

- (int64_t) pt_memoryInactive;

- (int64_t) pt_memoryWired;

- (int64_t) pt_memoryPurgable;

@end

NS_ASSUME_NONNULL_END
