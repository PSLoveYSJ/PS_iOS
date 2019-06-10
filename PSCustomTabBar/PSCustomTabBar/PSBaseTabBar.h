//
//  PSBaseTabBar.h
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/10.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTabBar/PSTabBar.h"


typedef NS_ENUM(NSInteger, PSTabBarType) {
    PSTabBarTypeNone = 0, // 基础
    PSTabBarTypeBackImage, // 背景图
    PSTabBarTypeBackImageSelectColor, // 背景图加选中颜色
    PSTabBarTypeBackImageTranslucent, // 背景图加模糊效果
    PSTabBarTypeCircularProjection, // 中间圆形凸出
    PSTabBarTypeMultiCircularProjection, // 多重圆形凸出
    PSTabBarTypeSquareProjection, // 矩形凸出
    PSTabBarTypeHybridProjection, // 混合凸出
    PSTabBarTypeCustomButtonSize, // 按钮自定义按钮大小
    PSTabBarTypeCustomButtonAlignmentModle, // 按钮自定义对齐模式
    PSTabBarTypeCustomButtonLayoutModle, // 按钮自定义布局模式
    PSTabBarTypeCustomButtonLogo, // 按钮自定义徽标
    PSTabBarTypeCustomButtonInteractionAnimation, // 按钮自定义交互动画
    PSTabBarTypeCustomButtonDrawingPicture, // 按钮自定义渲染图片
    PSTabBarTypeCustomButtonBackgroundColor, // 按钮自定义背景颜色
    PSTabBarTypeCustomButtonBackgroundImage, // 按钮自定义背景图
    PSTabBarTypeHybridGradient, // 渐变色
    PSTabBarTypeHybridButtonGradient, // 按钮渐变色
    
};

NS_ASSUME_NONNULL_BEGIN

@interface PSBaseTabBar : UITabBarController

@property (nonatomic, strong) PSTabBar *psTabBar;
@property (nonatomic, assign) PSTabBarType psTabBarType;

@end

NS_ASSUME_NONNULL_END
