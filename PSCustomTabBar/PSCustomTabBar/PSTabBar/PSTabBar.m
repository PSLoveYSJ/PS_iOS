//
//  PSTabBar.m
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/7.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSTabBar.h"
#import "PSTabBarItem.h"


@interface PSTabBar()


@property (nonatomic, strong) NSMutableArray <PSTabBarItem *> *items;;

@end

@implementation PSTabBar


static PSTabBarItem *lastItem;

#pragma mark &************ init

- (instancetype)init{
    self = [super init];
    if (self) {
        [self configuration];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self configuration];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configuration];
    }
    return self;
}
- (instancetype)initWithTabBarConfig:(NSArray<PSTabBarConfiguration *> *)tabBarConfig{
    self = [super init];
    if (self) {
        [self configuration];
        [self setTabBarConfig:tabBarConfig];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self viewDidLayoutItems]; // 进行布局 （因为需要封装，所以没打算在第一时间进行布局）
    [self itemDidLayoutBulge];
    [self layoutTabBarSubViews];
}

- (void)viewDidLayoutItems {
    CGFloat screenAverageWidth = self.frame.size.width/self.items.count;
    [self.items enumerateObjectsUsingBlock:^(PSTabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect itemFrame = item.frame;
        CGFloat itemHeight = self.frame.size.height;
        if ([self isiPhoneX] || itemHeight > 50) {
            itemHeight = 49; // iphoneX高度要小
        }
        BOOL isNoSettingItemSize = !item.itemModel.itemSize.width || !item.itemModel.itemSize.height;
        if (isNoSettingItemSize) { // 没设置则为默认填充模式
            itemFrame.origin.x = idx * screenAverageWidth;
            itemFrame.size = CGSizeMake(screenAverageWidth , itemHeight);
        }else{ // 如果设置了大小
            itemFrame.size = item.itemModel.itemSize;
            // 进行动态布局
            switch (item.itemModel.alignmentStyle) { // item对齐模式
                case PSTabBarConfigurationAlignmentStyleCenter:{               // 居中 默认
                    itemFrame.origin.x = idx * screenAverageWidth + (screenAverageWidth - item.itemModel.itemSize.width)/2;
                    itemFrame.origin.y = (itemHeight - item.itemModel.itemSize.height)/2;
                }break;
                case PSTabBarConfigurationAlignmentStyleCenterTop:{            // 居中顶部对齐
                    itemFrame.origin.x = idx * screenAverageWidth + (screenAverageWidth - item.itemModel.itemSize.width)/2;
                    itemFrame.origin.y = 0;
                }break;
                case PSTabBarConfigurationAlignmentStyleCenterLeft:{           // 居中靠左对齐
                    itemFrame.origin.x = idx * screenAverageWidth;
                    itemFrame.origin.y = (itemHeight - item.itemModel.itemSize.height)/2;
                }break;
                case PSTabBarConfigurationAlignmentStyleCenterRight:{          // 居中靠右对齐
                    itemFrame.origin.x = idx * screenAverageWidth + (screenAverageWidth - item.itemModel.itemSize.width);
                    itemFrame.origin.y = (itemHeight - item.itemModel.itemSize.height)/2;
                }break;
                case PSTabBarConfigurationAlignmentStyleCenterBottom:{         // 居中靠下对齐
                    itemFrame.origin.x = idx * screenAverageWidth + (screenAverageWidth - item.itemModel.itemSize.width)/2;
                    itemFrame.origin.y = itemHeight - item.itemModel.itemSize.height;
                }break;
                case PSTabBarConfigurationAlignmentStyleTopLeft:{        // 上左对齐
                    itemFrame.origin.x = idx * screenAverageWidth;
                    itemFrame.origin.y = 0;
                }break;
                case PSTabBarConfigurationAlignmentStyleTopRight:{       // 上右对齐
                    itemFrame.origin.x = idx * screenAverageWidth + (screenAverageWidth - item.itemModel.itemSize.width);
                    itemFrame.origin.y = 0;
                }break;
                case PSTabBarConfigurationAlignmentStyleBottomLeft:{     // 下左对齐
                    itemFrame.origin.x = idx * screenAverageWidth;
                    itemFrame.origin.y = itemHeight - item.itemModel.itemSize.height;
                }break;
                case PSTabBarConfigurationAlignmentStyleBottomRight:{    // 下右对齐
                    itemFrame.origin.x = idx * screenAverageWidth + (screenAverageWidth - item.itemModel.itemSize.width);
                    itemFrame.origin.y = itemHeight - item.itemModel.itemSize.height;
                }break;
                default: break;
            }
        }
        item.frame = itemFrame;
        // 通知Item同时开始计算坐标
        [item itemDidLayoutControl];
    }];
}

- (void)layoutTabBarSubViews{
    // 适配背景图
    self.backgroundImageView.frame = self.frame;
    self.effectView.frame = self.frame;
}

// 适配凸出
- (void)itemDidLayoutBulge {
    CGFloat screenAverageWidth = self.frame.size.width/self.items.count;
    [self.items enumerateObjectsUsingBlock:^(PSTabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect itemFrame = item.frame;
        CGFloat sideLength = MAX(itemFrame.size.width, itemFrame.size.height);
        switch (item.itemModel.bulgeStyle) {
            case PSTabBarConfigurationBulgeStyleNone:{
            }break;         // 无 默认
            case PSTabBarConfigurationBulgeStyleCircular:{
                itemFrame.size = CGSizeMake(sideLength, sideLength);
                itemFrame.origin.y = - item.itemModel.bulgeHeight;
                itemFrame.origin.x = idx * screenAverageWidth + (screenAverageWidth - sideLength)/2; // 居中
                item.frame = itemFrame;
                item.layer.masksToBounds = YES;
                if (item.itemModel.bulgeRoundedCorners) {
                    item.layer.cornerRadius = item.itemModel.bulgeRoundedCorners;
                }else{
                    item.layer.cornerRadius = sideLength/2;
                }
            }break;           // 圆形
            case PSTabBarConfigurationBulgeStyleSquare:{
                itemFrame.origin.y = - item.itemModel.bulgeHeight;
                itemFrame.origin.x = idx * screenAverageWidth + (screenAverageWidth - itemFrame.size.width)/2; // 居中
                item.frame = itemFrame;
                if (item.itemModel.bulgeRoundedCorners) {
                    item.layer.masksToBounds = YES;
                    item.layer.cornerRadius = item.itemModel.bulgeRoundedCorners;
                }
            }break;              // 方形
            default: break;
        }
        item.frame = itemFrame;
    }];
}

- (void) configuration {
    [self hiddenUITabBarButton]; // 8.4补丁
    [self addSubview:self.backgroundImageView]; // 添加背景图
    [self.backgroundImageView addSubview:self.effectView];
}

#pragma mark &************ btn click method

// 点击的tabbarItem
- (void)click_tabBarItem:(PSTabBarItem *)sender{
    NSInteger clickIndex = sender.tag - 100;
    [self switch_tabBarItemIndex:clickIndex WithAnimation:YES];
}

// 切换页面/状态
- (void)switch_tabBarItemIndex:(NSInteger )index WithAnimation:(BOOL )animation {
    // 1.切换tabbar的状态
    [self.items enumerateObjectsUsingBlock:^(PSTabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        item.isSelect = index == idx; // 当前点击的调整选中，其他否定
    }];
    // 动画逻辑
    __weak typeof(self) weakSelf = self;; // 2.通过回调点击事件让代理去执行切换选项卡的任务
    PSTabBarItem *item = self.items[index];
    if (item.itemModel.isRepeatClick) { // 允许重复点击触发动画
        if (animation) [item startStrringConfigAnimation]; // 开始执行设置的动画效果
        if (self.delegate && [self.delegate respondsToSelector:@selector(ps_tabBar:didSelectIndex:)]) {
            [self.delegate ps_tabBar:weakSelf didSelectIndex:index];
        }
    }else{
        if (![lastItem isEqual: item]) { // 不是上次点击的
            lastItem = item;
            if (animation) [item startStrringConfigAnimation]; // 开始执行设置的动画效果
            if (self.delegate && [self.delegate respondsToSelector:@selector(ps_tabBar:didSelectIndex:)]) {
                [self.delegate ps_tabBar:weakSelf didSelectIndex:index];
            }
        }
    }
    [self hiddenUITabBarButton];
}

// 文字重叠，隐藏系统的tabbaritem
- (void)hiddenUITabBarButton {
    if ([self.superview isKindOfClass:[UITabBar class]]) {
        UITabBar *tabbar = (UITabBar *)self.superview;
        dispatch_queue_t queue  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), queue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                for (UIView *btn in tabbar.subviews) {
                    if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                        btn.hidden = YES;
                    }
                }
                [self.superview bringSubviewToFront:self]; // 放置到最前
            });
        });
    }
}


#pragma mark &************ setter getter

- (void)setTabBarConfig:(NSArray<PSTabBarConfiguration *> *)tabBarConfig {
    _tabBarConfig = tabBarConfig;
    [_tabBarConfig enumerateObjectsUsingBlock:^(PSTabBarConfiguration * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PSTabBarItem *item = [[PSTabBarItem alloc] initWithModel:obj]; // 模型转成实例
        item.itemIndex = idx; // 交付索引
        item.tintColor = self.tintColor;
        item.tag = 100 + idx; // 区分Tag
        [item addTarget:self action:@selector(click_tabBarItem:) forControlEvents:UIControlEventTouchUpInside];
        if (!idx) {
            item.isSelect = YES;
        }
        [self addSubview:item];
        [self.items addObject:item];
    }];
}

- (void)setBadge:(NSString *)Badge index:(NSUInteger)index{
    if (index < self.items.count) {
        PSTabBarItem *item = self.items[index];
        item.badge = Badge;
    }else{
        NSException *excp = [NSException exceptionWithName:@"PSTabBar Error"
                                                    reason:@"设置脚标越界！" userInfo:nil];
        [excp raise]; // 抛出异常
    }
}

- (NSArray<PSTabBarItem *> *)tabBarItems {
    return self.items;
}

- (PSTabBarItem *)currentSelectItem {
    return [self.tabBarItems objectAtIndex:self.selectIndex];
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    [self switch_tabBarItemIndex:_selectIndex WithAnimation:NO];
}

- (void)setSelectIndex:(NSInteger)selectIndex WithAnimation:(BOOL)animation {
    [self switch_tabBarItemIndex:selectIndex WithAnimation:YES];
}

- (void)setTranslucent:(BOOL)translucent {
    _translucent = translucent;
    self.effectView.hidden = !_translucent;
}

- (BOOL)isiPhoneX {
    BOOL isPhoneX = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return NO;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            isPhoneX = YES;
        }
    }
    return isPhoneX;
}

- (UIBlurEffect *)effect{
    if (!_effect) {
        _effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    }
    return _effect;
}
- (UIVisualEffectView *)effectView{
    if (!_effectView) {
        _effectView = [[UIVisualEffectView alloc] initWithEffect:self.effect];
        _effectView.frame = self.bounds;
        _effectView.hidden = YES;
    }
    return _effectView;
}

- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [UIImageView new];
    }
    return _backgroundImageView;
}

- (NSMutableArray<PSTabBarItem *> *)items {
    if (!_items) {
        _items = @[].mutableCopy;
    }
    return _items;
}

@end
