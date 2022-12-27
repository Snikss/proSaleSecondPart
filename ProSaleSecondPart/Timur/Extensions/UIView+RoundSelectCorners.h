//
//  UIView+RoundSelectCorners.h
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 26.12.2022.
//

#import <UIKit/UIKit.h>

@interface UIView (RoundSelectCorners)

/**
 Метод скругляет определенные углы UIView
 
 Метод следуется вызывать при каждом layout view для корректной работы
 
 @param corners Углы для скругления. Например, (UIRectCornerTopLeft | UIRectCornerTopRight)
 @param radius Радиус углов
 */
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;

/**
 Метод скругляет определенные углы UIView (iOS11)
 
 @param corners Углы для скругления. Например, (kLayerMinXMinYCorner | kLayerMaxXMinYCorner)
 @param radius Радиус углов
 
 @discussion
 - kLayerMinXMinYCorner = topLeft
 
 - kLayerMaxXMinYCorner = topRight
 
 - kLayerMinXMaxYCorner = bottomLeft
 
 - kLayerMaxXMaxYCorner = bottomRight
 */
- (void)setRoundedCorner:(CACornerMask)corners radius:(CGFloat)radius API_AVAILABLE(ios(11));

@end
