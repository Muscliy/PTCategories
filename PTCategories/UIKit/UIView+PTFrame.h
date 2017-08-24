//
//  UIView+PTFrame.h
//  PTCategories
//
//  Created by LeeHu on 8/24/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PTFrame)

// shortcuts for frame properties
@property (nonatomic, assign) CGPoint pt_origin;
@property (nonatomic, assign) CGSize pt_size;

// shortcuts for positions
@property (nonatomic) CGFloat pt_centerX;
@property (nonatomic) CGFloat pt_centerY;


@property (nonatomic) CGFloat pt_top;
@property (nonatomic) CGFloat pt_bottom;
@property (nonatomic) CGFloat pt_right;
@property (nonatomic) CGFloat pt_left;

@property (nonatomic) CGFloat pt_width;
@property (nonatomic) CGFloat pt_height;

@end
