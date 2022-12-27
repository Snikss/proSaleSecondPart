//
//  UIView+RoundSelectCorners.m
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 26.12.2022.
//

#import "UIView+RoundSelectCorners.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (RoundSelectCorners)

- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    CGRect rect = self.bounds;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}

- (void)setRoundedCorner:(CACornerMask)corners radius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.maskedCorners = corners;
}

@end
