//
//  PSTabBarItem.h
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/7.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTabBadgeLabel.h"

NS_ASSUME_NONNULL_BEGIN


/**
 凸出形状
 */
typedef NS_ENUM(NSInteger,PSTabBarConfigurationBulgeStyle) {
    PSTabBarConfigurationBulgeStyleNone = 0, // 凸出
    PSTabBarConfigurationBulgeStyleSquare, // 圆形
    PSTabBarConfigurationBulgeStyleCircular // 方形
};

// item在tabbar的布局
typedef NS_ENUM(NSInteger, PSTabBarConfigurationAlignmentStyle) {
    PSTabBarConfigurationAlignmentStyleCenter = 0,           // 居中 默认
    PSTabBarConfigurationAlignmentStyleCenterTop,            // 顶部对齐
    PSTabBarConfigurationAlignmentStyleCenterLeft,           // 靠左对齐
    PSTabBarConfigurationAlignmentStyleCenterRight,          // 靠右对齐
    PSTabBarConfigurationAlignmentStyleCenterBottom,         // 靠下对齐
    
    PSTabBarConfigurationAlignmentStyleTopLeft,        // 上左对齐
    PSTabBarConfigurationAlignmentStyleTopRight,       // 上右对齐
    
    PSTabBarConfigurationAlignmentStyleBottomLeft,     // 下左对齐
    PSTabBarConfigurationAlignmentStyleBottomRight,    // 下右对齐
};

// item内部组件布局模式
typedef NS_ENUM(NSInteger, PSTabBarItemLayoutStyle) {
    PSTabBarItemLayoutStyleTopPictureBottomTitle = 0,   // 上图片下文字 默认
    PSTabBarItemLayoutStyleBottomPictureTopTitle,       // 下图片上文字
    PSTabBarItemLayoutStyleLeftPictureRightTitle,       // 左图片右文字
    PSTabBarItemLayoutStyleRightPictureLeftTitle,       // 右图片左文字
    PSTabBarItemLayoutStylePicture,                     // 单图片占满全部
    PSTabBarItemLayoutStyleTitle,                       // 单标题占满全部
};

// item的Badge脚标方位
typedef NS_ENUM(NSInteger, PSTabBarItemBadgeStyle) {
    PSTabBarItemBadgeStyleTopRight = 0,   // 右上方 默认
    PSTabBarItemBadgeStyleTopCenter,      // 上中间
    PSTabBarItemBadgeStyleTopLeft         // 左上方
};

// 点击触发时候的交互效果
typedef NS_ENUM(NSInteger, PSTabBarInteractionEffectStyle) {
    PSTabBarInteractionEffectStyleNone,     // 无 默认
    PSTabBarInteractionEffectStyleSpring,   // 放大放小弹簧效果
    PSTabBarInteractionEffectStyleShake,    // 摇动动画效果
    PSTabBarInteractionEffectStyleAlpha,    // 透明动画效果
    PSTabBarInteractionEffectStyleCustom,   // 自定义动画效果
};


@class PSTabBarItem;

typedef void(^CustomInteractionEffectBlock)(PSTabBarItem *item);


@interface PSTabBarConfiguration : NSObject

#pragma mark - 标题
// item的标题
@property(nonatomic, copy)NSString *itemTitle;
// 默认标题颜色 默认灰色
@property (nonatomic, strong) UIColor *normalColor;
// 选中标题颜色 默认AxcAE_TabBarItemSlectBlue
@property (nonatomic, strong) UIColor *selectColor;

#pragma mark - 图片
// 选中后的图片名称
@property(nonatomic, copy)NSString *selectImageName;
// 正常的图片名称
@property(nonatomic, copy)NSString *normalImageName;
// 默认的 图片tintColor
@property(nonatomic, strong)UIColor *normalTintColor;
// 选中的 图片tintColor
@property(nonatomic, strong)UIColor *selectTintColor;

#pragma mark - item背景
// 默认的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *normalBackgroundColor;
// 选中的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *selectBackgroundColor;
// 单个item的背景图
@property(nonatomic, strong)UIImageView *backgroundImageView;

#pragma mark - item附加
// 凸出形变类型
@property(nonatomic, assign)PSTabBarConfigurationBulgeStyle bulgeStyle;
// 凸出高于TabBar多高 默认20
@property(nonatomic, assign)CGFloat bulgeHeight;
// 突出后圆角 默认0  如果是圆形的圆角，则会根据设置的ItemSize最大宽度自动裁切，设置后将按照此参数进行裁切
@property(nonatomic, assign)CGFloat bulgeRoundedCorners;
// item相对TabBar对齐模式
@property(nonatomic, assign)PSTabBarConfigurationAlignmentStyle alignmentStyle;
// item大小
@property(nonatomic, assign)CGSize itemSize;
// 角标内容
@property(nonatomic, strong)NSString *badge;
// 角标方位
@property(nonatomic, assign)PSTabBarItemBadgeStyle itemBadgeStyle;
// 为零是否自动隐藏 默认不隐藏
@property(nonatomic, assign)BOOL automaticHidden;

#pragma mark - item内部组件控制类
// TitleLabel指针
@property (nonatomic, strong) UILabel *titleLabel;
// imageView
@property (nonatomic, strong) UIImageView *icomImgView;
// item内部组件布局模式
@property(nonatomic, assign)PSTabBarItemLayoutStyle itemLayoutStyle;
// titleLabel大小 有默认值
@property(nonatomic, assign)CGSize titleLabelSize;
// icomImgView大小 有默认值
@property(nonatomic, assign)CGSize icomImgViewSize;
// 所有组件距离item边距 默认 UIEdgeInsetsMake(5, 5, 10, 5)
@property(nonatomic, assign)UIEdgeInsets componentMargin;
// 图片文字的间距 默认 2
@property(nonatomic, assign)CGFloat pictureWordsMargin;

#pragma mark - item交互控制类
// 点击触发后的交互效果
@property(nonatomic, assign)PSTabBarInteractionEffectStyle interactionEffectStyle;
// 是否允许重复点击触发动画 默认NO
@property(nonatomic, assign)BOOL isRepeatClick;
// 当交互效果选选择自定义时，会回调以下Block
@property(nonatomic, copy)CustomInteractionEffectBlock customInteractionEffectBlock;
// 多个自定义时候使用区分的Tag
@property(nonatomic, assign)NSInteger tag;

@end

@interface PSTabBarItem : UIControl

// 构造
- (instancetype)initWithModel:(PSTabBarConfiguration *)itemModel;

// 标题
@property (nonatomic, copy) NSString *title;
// 默认标题颜色
@property (nonatomic, strong) UIColor *normalColor;
// 选中标题颜色
@property (nonatomic, strong) UIColor *selectColor;
// 默认的 Image
@property (nonatomic, strong) UIImage *normalImage;
// 选中的 Image
@property (nonatomic, strong) UIImage *selectImage;
// 默认的 图片tintColor
@property(nonatomic, strong)UIColor *normalTintColor;
// 选中的 图片tintColor
@property(nonatomic, strong)UIColor *selectTintColor;
// 默认的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *normalBackgroundColor;
// 选中的 按钮背景Color 默认无
@property(nonatomic, strong)UIColor *selectBackgroundColor;
// 单个item的背景图
@property(nonatomic, strong)UIImageView *backgroundImageView;
// 角标内容
@property(nonatomic, strong)NSString *badge;
// item的所在索引
@property(nonatomic, assign)NSInteger itemIndex;

// 选中状态
@property (nonatomic, assign) BOOL isSelect;
// imageView
@property (nonatomic, strong) UIImageView *icomImgView;
// 标题Label
@property (nonatomic, strong) UILabel *titleLabel;
// 角标Label
@property(nonatomic, strong)PSTabBadgeLabel *badgeLabel;

// 模型构造器
@property(nonatomic, strong)PSTabBarConfiguration *itemModel;
// 重新开始布局
- (void)itemDidLayoutControl;
// 开始执行设置的动画
- (void)startStrringConfigAnimation;

@end

NS_ASSUME_NONNULL_END
