//
//  PSWavyView.h
//  AnimationObject
//
//  Created by Peng on 2019/7/8.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ZHColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
typedef void(^PSWavyBlock)(CGFloat currentY);

@interface PSWavyView : UIView

/**
 *  浪弯曲度
 */
@property (nonatomic, assign) CGFloat wavyCurvature;
/**
 *  浪速
 */
@property (nonatomic, assign) CGFloat wavySpeed;
/**
 *  浪高
 */
@property (nonatomic, assign) CGFloat wavyHeight;
/**
 *  浪色
 */
@property (nonatomic, strong) UIColor *wavycolor;

@property (nonatomic, copy) PSWavyBlock wavyBlock;

- (void)stopWavyAnimation;

- (void)startWavyAnimation;

@end

NS_ASSUME_NONNULL_END
