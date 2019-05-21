//
//  ViewAnimation.m
//  AnimationObject
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewAnimation.h"

@interface ViewAnimation()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewAnimation

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void) setUpUI {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetHeight(self.bounds) / 2
                                                                   , 20
                                                                   , CGRectGetHeight(self.bounds) / 2
                                                                   , CGRectGetHeight(self.bounds) * 824 / 640 ) ];
    self.imageView.image = [UIImage imageNamed:@"0066UWNtgy6Viz3mEBoce&690.jpg"];
    [self addSubview:self.imageView];
    
    [UIView animateWithDuration:1 animations:^{
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
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
