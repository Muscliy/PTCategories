//
//  UIColor+PTHex.h
//  PTCategories
//
//  Created by LeeHu on 8/24/17.
//  Copyright © 2017 leehu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (PTHex)

+ (UIColor *)pt_randomColor;

+ (UIColor *)pt_colorFromHexRGB:(NSString *)inColorString;

+ (UIColor *)pt_colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)pt_colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

+ (UIColor *)pt_colorFromInt:(NSInteger)intValue;

- (BOOL)pt_isEqualToColor:(UIColor *)color;

@end
