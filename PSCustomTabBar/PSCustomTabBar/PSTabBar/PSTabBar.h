//
//  PSTabBar.h
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/7.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSTabBar;
@class PSTabBarItem;
@class PSTabBarConfiguration;

NS_ASSUME_NONNULL_BEGIN


@protocol PSTabBarDelegate <NSObject>

- (void) ps_tabBar:(PSTabBar *) tabBar didSelectIndex:(NSInteger) index;

@end

@interface PSTabBar : UIView

// 重载构造创建方法
- (instancetype)initWithTabBarConfig:(NSArray <PSTabBarConfiguration *> *)tabBarConfig;
// 直接设置/SET方法
@property(nonatomic, strong)NSArray <PSTabBarConfiguration *>*tabBarConfig;
// 进行item子视图重新布局 最好推荐在TabBarVC中的 -viewDidLayoutSubviews 中执行，可以达到自动布局的效果
- (void)viewDidLayoutItems;
// TabBar背景图
@property(nonatomic, strong)UIImageView *backgroundImageView;
// 当前选中的 TabBar
@property (nonatomic, strong) PSTabBarItem *currentSelectItem;
// 设置角标
- (void)setBadge:(NSString *)Badge index:(NSUInteger)index;
// 是否开启毛玻璃模糊效果 默认NO不开启
@property(nonatomic, assign)BOOL translucent;
// 模糊效果的构造Style
@property(nonatomic, strong)UIBlurEffect* effect;
// 模糊效果的视图
@property(nonatomic, strong)UIVisualEffectView* effectView;

#pragma mark - 存储/获取属性
// 使/获取 当前选中下标
@property (nonatomic, assign) NSInteger selectIndex;
// 是否触发设置的动画效果
- (void)setSelectIndex:(NSInteger)selectIndex WithAnimation:(BOOL )animation;

// TabbarItems集合
@property (nonatomic, readonly, strong) NSArray <PSTabBarItem *> *tabBarItems;
// 代理
@property (nonatomic, weak) id <PSTabBarDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
