//
//  PSCAAnimationController.m
//  AnimationObject
//
//  Created by Peng on 2019/7/1.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSCAAnimationController.h"
#import "PSDefines.h"

@interface PSCAAnimationController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PSCAAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)click:(id)sender {
    NSInteger index = arc4random() % 10;
    switch (index) {
        case 0: {
            self.imageView.image = nil;
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
            [self.imageView.layer addAnimation:animation forKey:nil];
            dispatch_after_P(animation.duration + 1, ^{
                self.imageView.image = [UIImage imageNamed:@"0066"];
            });
        }
            break;
        case 1: {
            CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
            scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];
            scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
            scaleAnimation.duration = 1.5;
            scaleAnimation.cumulative = NO;
            scaleAnimation.repeatCount = 1;
            [scaleAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
            self.imageView.layer.transform = CATransform3DMakeScale(1, 1, 1);//当动画完成后，保持现状
            [self.imageView.layer addAnimation: scaleAnimation forKey:@"myScale"];
        }
            
            break;
        case 2: {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
            
            animation.fromValue = [NSNumber numberWithFloat:1.0f];
            
            animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
            
            animation.autoreverses = YES;
            
            animation.duration = 2;
            
            animation.repeatCount = 4;
            
            animation.removedOnCompletion = NO;
            
            animation.fillMode = kCAFillModeForwards;
            
            animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
            [self.imageView.layer addAnimation:animation forKey:@"opacity"];
        }
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
        case 8:
            
            break;
        case 9:
            
            break;
        default:
            break;
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
