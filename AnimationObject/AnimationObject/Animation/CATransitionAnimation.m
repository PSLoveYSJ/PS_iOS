//
//  CATransitionAnimation.m
//  AnimationObject
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "CATransitionAnimation.h"


@interface CATransitionAnimation()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CATransitionAnimation

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void) setUpUI {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetHeight(self.bounds)
                                                                   , 20
                                                                   , CGRectGetHeight(self.bounds) / 2
                                                                   , CGRectGetHeight(self.bounds) * 824 / 640 ) ];
    self.imageView.image = [UIImage imageNamed:@"0066UWNtgy6Viz3mEBoce&690.jpg"];
    [self addSubview:self.imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = kCATransitionPush;
    /**
     fade 淡入淡出效果
     moveIn 新视图移动到旧视图
     push 推出 kCATransitionPush
     revel 旧视图移开显示下面的新视图
     私有API
     cube 立方体
     oglFlip 翻转效果
     suckEffect 收缩效果
     rippleEffect 水滴波纹
     pageCurl 向上翻页
     pageUnCurl 向下翻页
     cameraIrisHollowOpen 摄像头打开
     cameraIrisHollowClose 摄像头关闭
     */
    animation.subtype = kCATransitionFromRight; // 上下左右
    [self.layer addAnimation:animation forKey:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
