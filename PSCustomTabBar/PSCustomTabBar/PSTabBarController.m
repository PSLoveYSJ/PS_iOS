//
//  PSTabBarController.m
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/10.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSTabBarController.h"
#import "PSTabBar/PSTabBarItem.h"
#import "PSTabBar/PSGradientHelper.h"

@interface PSTabBarController ()<PSTabBarDelegate>

@property (nonatomic, assign) PSTabBarType tabBarType;
@property (nonatomic, strong) UIImageView *gradientImageView;

@end

@implementation PSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)addChildViewControllers {
    // 创建选项卡的数据 想怎么写看自己，这块我就写笨点了
    NSArray <NSDictionary *>*VCArray =
    @[@{@"vc":[UIViewController new],@"normalImg":@"homePage",@"selectImg":@"homePage_select",@"itemTitle":@"首页"},
      @{@"vc":[UIViewController new],@"normalImg":@"task",@"selectImg":@"task_select",@"itemTitle":@"列表"},
      @{@"vc":[UIViewController new],@"normalImg":@"complaint",@"selectImg":@"complaint_select",@"itemTitle":@"消息"},
      @{@"vc":[UIViewController new],@"normalImg":@"home_activity",@"selectImg":@"home_activity_select",@"itemTitle":@"星星"},
      @{@"vc":[UIViewController new],@"normalImg":@"me",@"selectImg":@"me_select",@"itemTitle":@"我的"}];
    // 1.遍历这个集合
    // 1.1 设置一个保存构造器的数组
    NSMutableArray *tabBarConfs = @[].mutableCopy;
    // 1.2 设置一个保存VC的数组
    NSMutableArray *tabBarVCs = @[].mutableCopy;
    [VCArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 2.根据集合来创建TabBar构造器
        PSTabBarConfiguration *model = [PSTabBarConfiguration new];
        // 3.item基础数据三连
        model.itemTitle = [obj objectForKey:@"itemTitle"];
        model.selectImageName = [obj objectForKey:@"selectImg"];
        model.normalImageName = [obj objectForKey:@"normalImg"];
        // 4.设置单个选中item标题状态下的颜色
        model.selectColor = [UIColor orangeColor];
        switch (self.tabBarType) {
            case PSTabBarTypeBackImageSelectColor: {
                // 设置选中的背景颜色
                model.selectBackgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
                // 将图片默认ting渲染成白色显眼点
                model.normalTintColor = [UIColor whiteColor];
                // 标题文字默认颜色
                model.normalColor = [UIColor whiteColor];
                // 将图片选中ting渲染成白色显眼点
                model.selectTintColor = [UIColor orangeColor];
                // 标题文字选中颜色
                model.selectColor = [UIColor orangeColor];
            }
                break;
            case PSTabBarTypeCircularProjection: {
                if (idx == 2 ) { // 如果是中间的
                    // 设置凸出
                    model.bulgeStyle = PSTabBarConfigurationBulgeStyleCircular;
                    // 设置成纯文字展示
                    model.itemLayoutStyle = PSTabBarItemLayoutStyleTitle;
                    // 文字为加号
                    model.itemTitle = @"+";
                    // 字号大小
                    model.titleLabel.font = [UIFont systemFontOfSize:50];
                    model.normalColor = [UIColor grayColor]; // 未选中是灰色加号
                    model.selectColor = [UIColor whiteColor];   // 选中后为白色加号
                    // 让Label上下左右全边距 稍微向上拉一点
                    model.componentMargin = UIEdgeInsetsMake(-10, 0, 0, 0 );
                    // 未选中状态是白色
                    model.normalBackgroundColor = [UIColor whiteColor];
                    // 选中为橘里橘气
                    model.selectBackgroundColor = [UIColor orangeColor];
                    // 设置大小/边长
                    model.itemSize = CGSizeMake(40, 70); // 自动以长款中最大值进行切圆
                }
            }
                break;
            case PSTabBarTypeMultiCircularProjection: {
                if (idx == 2 || idx == 4 ) { // 如果是中间的
                    // 设置凸出
                    model.bulgeStyle = PSTabBarConfigurationBulgeStyleCircular;
                    // 设置成纯文字展示
                    model.itemLayoutStyle = PSTabBarItemLayoutStyleTitle;
                    // 文字为加号
                    model.itemTitle = @"+";
                    // 字号大小
                    model.titleLabel.font = [UIFont systemFontOfSize:50];
                    model.normalColor = [UIColor grayColor]; // 未选中是灰色加号
                    model.selectColor = [UIColor whiteColor];   // 选中后为白色加号
                    // 让Label上下左右全边距 稍微向上拉一点
                    model.componentMargin = UIEdgeInsetsMake(-10, 0, 0, 0 );
                    // 未选中状态是白色
                    model.normalBackgroundColor = [UIColor whiteColor];
                    // 选中为橘里橘气
                    model.selectBackgroundColor = [UIColor orangeColor];
                    // 设置大小/边长
                    model.itemSize = CGSizeMake(40, 70); // 自动以长款中最大值进行切圆
                }
            }
                break;
            case PSTabBarTypeSquareProjection: {
                if (idx == 2) {
                    // 设置凸出
                    model.bulgeStyle = PSTabBarConfigurationBulgeStyleSquare;
                    // 设置凸出高度
                    model.bulgeHeight = 10;
                    // 设置成纯图片展示
                    model.itemLayoutStyle = PSTabBarItemLayoutStylePicture;
                    // 稍微修饰个小圆角
                    model.bulgeRoundedCorners = 10;
                    // 设置图片
                    model.selectImageName = @"CenterAdd";
                    model.normalImageName = @"CenterAdd";
                    // 设置图片大小
                    model.icomImgViewSize = CGSizeMake(30, 30);
                    
                    /** 图片颜色 ************************/
                    // 未选中橘色
                    model.normalTintColor = [UIColor orangeColor];
                    // 选中白色
                    model.selectTintColor = [UIColor whiteColor];
                    /***********************************/
                    /** 背景颜色 ************************/
                    // 未选中状态是白色
                    model.normalBackgroundColor = [UIColor whiteColor];
                    // 选中为橘里橘气
                    model.selectBackgroundColor = [UIColor orangeColor];
                    /***********************************/
                    // 设置大小/边长
                    model.itemSize = CGSizeMake(60, 50); // 自动以长款中最大值进行切圆
                }
            }
                break;
            case PSTabBarTypeHybridProjection: {
                if (idx == 1 || idx == 3) {
                    if (idx == 1) {
                        model.bulgeStyle = PSTabBarConfigurationBulgeStyleSquare;
                        // 凸出高度 25pt
                        model.bulgeHeight = 25;
                        // 切个小圆角
                        model.bulgeRoundedCorners = 5;
                    } else if (idx == 3) {
                        model.bulgeStyle = PSTabBarConfigurationBulgeStyleCircular;
                        // 凸出高度 20pt
                        model.bulgeHeight = 20;
                    }
                    model.itemLayoutStyle = PSTabBarItemLayoutStyleTitle;
                    // 文字为加号
                    model.itemTitle = @"+";
                    // 字号大小
                    model.titleLabel.font = [UIFont systemFontOfSize:50];
                    model.normalColor = [UIColor grayColor]; // 未选中是灰色加号
                    model.selectColor = [UIColor whiteColor];   // 选中后为白色加号
                    // 让Label上下左右全边距 稍微向上拉一点
                    model.componentMargin = UIEdgeInsetsMake(-10, 0, 0, 0 );
                    // 未选中状态是白色
                    model.normalBackgroundColor = [UIColor whiteColor];
                    // 选中为橘里橘气
                    model.selectBackgroundColor = [UIColor orangeColor];
                    // 设置大小/边长
                    model.itemSize = CGSizeMake(40, 70); // 自动以长款中最大值进行切圆
                }
            }
                break;
            case PSTabBarTypeCustomButtonSize:{
                model.itemSize = CGSizeMake(40, 40);
            }
                break;
            case PSTabBarTypeCustomButtonAlignmentModle: {
                model.itemSize = CGSizeMake(70, 40);
                if (idx == 0) {
                    model.alignmentStyle = PSTabBarConfigurationAlignmentStyleTopLeft;
                }
                if (idx == 2) {
                    model.alignmentStyle = PSTabBarConfigurationAlignmentStyleBottomRight;
                }
                if (idx == 3) {
                    model.alignmentStyle = PSTabBarConfigurationAlignmentStyleCenterTop;
                }
                if (idx == 4) {
                    model.alignmentStyle = PSTabBarConfigurationAlignmentStyleCenterBottom;
                }
            }
                break;
            case PSTabBarTypeCustomButtonLayoutModle:{
                if (idx == 0) {
                    model.itemLayoutStyle = PSTabBarItemLayoutStylePicture;
                }
                if (idx == 2) {
                    model.itemLayoutStyle = PSTabBarItemLayoutStyleTitle;
                }
                if (idx == 3) {
                    model.itemLayoutStyle = PSTabBarItemLayoutStyleBottomPictureTopTitle;
                }
                if (idx == 4) {
                    model.itemLayoutStyle = PSTabBarItemLayoutStyleRightPictureLeftTitle;;
                }
            }
                break;
            case PSTabBarTypeCustomButtonLogo: {
                model.badge = [NSString stringWithFormat:@"%d",arc4random() % 100 + 10];
                if (idx == 0 || idx == 2) {
                    model.itemBadgeStyle = PSTabBarItemBadgeStyleTopLeft;
                }
                if (idx == 1 || idx == 3) {
                    model.itemBadgeStyle = PSTabBarItemBadgeStyleTopCenter;
                }
            }
                break;
            case PSTabBarTypeCustomButtonInteractionAnimation: {
                model.tag = 100 + idx;
                if (idx == 0) {
                    model.interactionEffectStyle = PSTabBarInteractionEffectStyleShake;
                } else if (idx == 1) {
                    model.interactionEffectStyle = PSTabBarInteractionEffectStyleSpring;
                } else if (idx == 2) {
                    model.interactionEffectStyle = PSTabBarInteractionEffectStyleAlpha;
                } else {
                    model.interactionEffectStyle = PSTabBarInteractionEffectStyleCustom;
                }
                // 自定义动画回调Block
                model.customInteractionEffectBlock = ^(PSTabBarItem *item) {
                    
                    if (item.itemModel.tag - 100 == 3) { // 第四个
                        NSLog(@"触发第四个Item的自定义动画");
                        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
                        animation.keyPath = @"transform.scale";
                        animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
                        animation.duration = 1;
                        animation.calculationMode = kCAAnimationCubic;
                        [item.layer addAnimation:animation forKey:nil];
                    }else if (item.itemModel.tag - 100 == 4){ // 第五个
                        NSLog(@"触发第五个Item的自定义动画");
                        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
                        CGFloat angle = M_PI_4 / 10;
                        animation.values = @[@(-angle), @(angle), @(-angle)];
                        animation.duration = 1;
                        [item.layer addAnimation:animation forKey:nil];
                    }else{}
                };
            }
                break;
            case PSTabBarTypeCustomButtonDrawingPicture: {
                model.selectTintColor = model.selectColor  = [UIColor colorWithRed: arc4random() % 255 /255.0 green:arc4random() % 255 / 255.0 blue: arc4random() % 255 / 255.0 alpha:1];
            }
                break;
            case PSTabBarTypeCustomButtonBackgroundColor: {
                model.selectTintColor = model.selectColor  = [UIColor whiteColor];
                model.selectBackgroundColor = [UIColor colorWithRed: arc4random() % 255 /255.0 green:arc4random() % 255 / 255.0 blue: arc4random() % 255 / 255.0 alpha:1];
            }
                break;
            case PSTabBarTypeCustomButtonBackgroundImage: {
                UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"item_%ld",idx + 1]];
                model.backgroundImageView.image = img;
            }
                break;
            default:
                break;
        }
        
        // 备注 如果一步设置的VC的背景颜色，VC就会提前绘制驻留，优化这方面的话最好不要这么写
        // 示例中为了方便就在这写了
        UIViewController *vc = [obj objectForKey:@"vc"];
        vc.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.f
                                                  green:arc4random()%255/255.f
                                                   blue:arc4random()%255/255.f alpha:1];
        // 5.将VC添加到系统控制组
        [tabBarVCs addObject:vc];
        // 5.1添加构造Model到集合
        [tabBarConfs addObject:model];
    }];
    self.viewControllers = tabBarVCs;
    self.psTabBar = [PSTabBar new] ;
    self.psTabBar.tabBarConfig = tabBarConfs;
    self.psTabBar.delegate = self;
    
    switch (self.tabBarType) {
        case PSTabBarTypeBackImage:
            self.psTabBar.backgroundImageView.image = [UIImage imageNamed:@"backImg"];
            break;
        case PSTabBarTypeBackImageTranslucent:
            self.psTabBar.backgroundImageView.image = [UIImage imageNamed:@"backImg"];
            self.psTabBar.translucent = YES;
            break;
        case PSTabBarTypeBackImageSelectColor:
            self.psTabBar.backgroundImageView.image = [UIImage imageNamed:@"backImg"];
            break;
            
        default:
            break;
    }
    
    [self.tabBar addSubview:self.psTabBar];
    [self addLayoutTabBar]; //
}



- (void) addLayoutTabBar {
    
}

- (void)setPsTabBarType:(PSTabBarType)psTabBarType {
    _tabBarType = psTabBarType;
    [self addChildViewControllers];
}

- (void)ps_tabBar:(PSTabBar *)tabBar didSelectIndex:(NSInteger)index {
    [self setSelectedIndex:index];
    if (self.tabBarType == PSTabBarTypeHybridButtonGradient) {
         [self clickItemWithIndex:index];
    }
   
}

- (void) clickItemWithIndex:(NSInteger) index {
    [self.psTabBar.tabBarItems enumerateObjectsUsingBlock:^(PSTabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == index) {
            obj.backgroundImageView.image = [PSGradientHelper getLinearGradientImage:[UIColor colorWithRed: arc4random() % 255 /255.0 green:arc4random() % 255 / 255.0 blue: arc4random() % 255 / 255.0 alpha:1] and:[UIColor colorWithRed: arc4random() % 255 /255.0 green:arc4random() % 255 / 255.0 blue: arc4random() % 255 / 255.0 alpha:1] directionType:PSLinearGradientDirectionVertical];
        } else {
            obj.backgroundImageView.image = nil;
        }
    }];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    if(self.psTabBar){
        self.psTabBar.selectIndex = selectedIndex;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.psTabBar.frame = self.tabBar.bounds;
    [self.psTabBar viewDidLayoutItems];
    switch (self.tabBarType) {
        case PSTabBarTypeHybridGradient:
            self.gradientImageView.frame = self.tabBar.bounds;

            break;
        default:
            break;
    }
}

- (UIImageView *)gradientImageView{
    if (!_gradientImageView) {
        _gradientImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        CGRect frame = self.tabBar.bounds;
        frame.size.width = [UIScreen mainScreen].bounds.size.height; // 直接设置最大，
        _gradientImageView.frame = frame;
        [self.psTabBar.backgroundImageView addSubview:_gradientImageView]; // 添加上去
        
        [PSGradientHelper addGradientChromatoAnimation:_gradientImageView];
    }
    return _gradientImageView;
}

@end
