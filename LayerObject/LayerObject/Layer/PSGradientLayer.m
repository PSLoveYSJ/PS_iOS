//
//  PSGradientLayer.m
//  LayerObject
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSGradientLayer.h"

@implementation PSGradientLayer

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void) setUpUI {
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    // 由图层绘制的渐变样式 kCAGradientLayerAxial 轴
    // Conic 二次曲线
    // Radial 径向
    gradientLayer.type = kCAGradientLayerRadial;
    // 默认（0.5， 0） 0，0 左上角 11 右下角
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
    gradientLayer.locations = @[@0.4,@0.6,@0.8];
    
    gradientLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor,
                             (__bridge id)[UIColor blueColor].CGColor,
                             (__bridge id)[UIColor yellowColor].CGColor];
    gradientLayer.frame = self.bounds;
    
    [self.layer addSublayer:gradientLayer];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
