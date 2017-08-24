//
//  UIView+PTFrame.m
//  PTCategories
//
//  Created by LeeHu on 8/24/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import "UIView+PTFrame.h"

@implementation UIView (PTFrame)

- (CGFloat)pt_top
{
    return self.frame.origin.y;
}

- (void)setpt_top:(CGFloat)pt_top
{
    CGRect frame = self.frame;
    frame.origin.y = pt_top;
    self.frame = frame;
}

- (CGFloat)pt_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setpt_right:(CGFloat)pt_right
{
    CGRect frame = self.frame;
    frame.origin.x = pt_right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)pt_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setpt_bottom:(CGFloat)pt_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = pt_bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)pt_left
{
    return self.frame.origin.x;
}

- (void)setpt_left:(CGFloat)pt_left
{
    CGRect frame = self.frame;
    frame.origin.x = pt_left;
    self.frame = frame;
}

- (CGFloat)pt_width
{
    return self.frame.size.width;
}

- (void)setpt_width:(CGFloat)pt_width
{
    CGRect frame = self.frame;
    frame.size.width = pt_width;
    self.frame = frame;
}

- (CGFloat)pt_height
{
    return self.frame.size.height;
}

- (void)setpt_height:(CGFloat)pt_height
{
    CGRect frame = self.frame;
    frame.size.height = pt_height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)pt_origin
{
    return self.frame.origin;
}

- (void)setpt_origin:(CGPoint)pt_origin
{
    CGRect frame = self.frame;
    frame.origin = pt_origin;
    self.frame = frame;
}

- (CGSize)pt_size
{
    return self.frame.size;
}

- (void)setpt_size:(CGSize)pt_size
{
    CGRect frame = self.frame;
    frame.size = pt_size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)pt_centerX
{
    return self.center.x;
}

- (void)setpt_centerX:(CGFloat)pt_centerX
{
    self.center = CGPointMake(pt_centerX, self.center.y);
}

- (CGFloat)pt_centerY
{
    return self.center.y;
}

- (void)setpt_centerY:(CGFloat)pt_centerY
{
    self.center = CGPointMake(self.center.x, pt_centerY);
}

@end
