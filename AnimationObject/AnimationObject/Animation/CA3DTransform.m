//
//  CA3DTransform.m
//  AnimationObject
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "CA3DTransform.h"

@interface CA3DTransform()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CA3DTransform

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
    CATransform3D transform = CATransform3DIdentity;
    /**
     CATransform3DMakeTranslation 3d平移
     CATransform3DMakeScale 缩放
     CATransform3DMakeRotation 旋转
     */
//    CATransform3DConcat 合并 a * b
    transform = CATransform3DScale(transform, 1.2, 1.3, 1.4); // 缩放
    transform = CATransform3DRotate(transform, M_PI, 1, 3, 3);
    transform = CATransform3DTranslate(transform, 20, 20, 30);
    transform.m34 = -1.0 / 500;
    /**
     CATransform3DInvert 相反的
     CATransform3DIsAffine 是否可以用Affine表示
     CATransform3DIsIdentity 恒等
     CATransform3DEqualToTransform 俩个3d是否相等
     CATransform3DMakeAffineTransform AffineTransform 转换为3DTransform
     CATransform3DGetAffineTransform 3DTransform 转换为 AffineTransform
     */
    
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.layer.transform = transform;
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
