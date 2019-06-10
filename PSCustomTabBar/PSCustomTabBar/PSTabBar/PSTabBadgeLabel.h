//
//  PSTabBadgeLabel.h
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/7.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PSTabBadgeLabel : UILabel

/**
 文字或数字
 */
@property(nonatomic, copy) NSString *badgeText;

/**
 数字为0的时候是否隐藏
 */
@property(nonatomic, assign) BOOL hiddenZero;

/**
 高度
 */
@property(nonatomic, assign) CGFloat badgeHeight;

/**
 背景色 默认 255 38 0
 */
@property (nonatomic, strong) UIColor *backgroundColor_ps;

@end

NS_ASSUME_NONNULL_END
