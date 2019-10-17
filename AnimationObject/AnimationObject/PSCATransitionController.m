//
//  PSCATransitionController.m
//  AnimationObject
//
//  Created by Peng on 2019/7/1.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSCATransitionController.h"

@interface PSCATransitionController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation PSCATransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)click:(id)sender {
    // CAAnimation
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
    [self.imageView.layer addAnimation:animation forKey:nil];
}




@end
