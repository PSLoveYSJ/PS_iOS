//
//  KeyAnimation.m
//  AnimationObject
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "KeyAnimation.h"


@interface KeyAnimation()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation KeyAnimation


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
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    // 需要做动画的属性
    animation.keyPath = @"backgroundColor";
    // 指定关键帧
    animation.values = @[(id)[UIColor whiteColor].CGColor
                         ,(id)[UIColor redColor].CGColor
                         ,(id)[UIColor blueColor].CGColor
                         ,(id)[UIColor blackColor].CGColor
                         ,(id)[UIColor whiteColor].CGColor];
    animation.keyTimes = @[@0.0,@0.2,@0.5,@0.7,@1.0];
    animation.duration = 5;
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                  ,[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                  ,[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                  ,[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                  ,[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
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
