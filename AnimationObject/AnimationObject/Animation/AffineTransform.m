//
//  AffineTransform.m
//  AnimationObject
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "AffineTransform.h"

@interface AffineTransform()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AffineTransform

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
    CGAffineTransform transform = CGAffineTransformIdentity; // 创建
    /**
     其他创建方式
     CGAffineTransformMakeTranslation
     CGAffineTransformMakeScale
     CGAffineTransformMakeRotation
     */
    transform = CGAffineTransformRotate(transform, M_PI * 1);
    transform = CGAffineTransformScale(transform, 1.2, 1.2);
    transform = CGAffineTransformTranslate(transform, 20, 10);
//    transform = CGAffineTransformInvert(transform); // 相反的
    /**
      CGAffineTransformConcat 俩个合起来
     CGAffineTransformEqualToTransform 判断俩个是否相等
     CGRectApplyAffineTransform 对矩阵进行变换
     CGSizeApplyAffineTransform 返回由对现有高度和宽度的转换产生的高度和宽度。
     */
    self.imageView.transform = transform;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
