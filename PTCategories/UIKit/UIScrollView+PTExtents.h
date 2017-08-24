//
//  UIScrollView+PTExtents.h
//  PTCategories
//
//  Created by LeeHu on 8/24/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (PTExtents)

- (void) pt_scrollToTop: (BOOL)animated;

- (void) pt_scrollToBottom: (BOOL)animated;

- (void) pt_scrollToLeft: (BOOL)animated;

- (void) pt_scrollToRight: (BOOL)animated;

@end
