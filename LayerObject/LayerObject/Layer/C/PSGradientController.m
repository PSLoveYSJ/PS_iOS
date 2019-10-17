//
//  PSGradientController.m
//  LayerObject
//
//  Created by Peng on 2019/7/9.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSGradientController.h"
#import "Header.h"

@interface PSGradientController ()<PSRouteHandler>

@end

@implementation PSGradientController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    // 由图层绘制的渐变样式 kCAGradientLayerAxial 轴
    // Conic 二次曲线
    // Radial 径向
    gradientLayer.type = kCAGradientLayerRadial;
    // 默认（0.5， 0） 0，0 左上角 11 右下角
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 0);
    
    gradientLayer.locations = @[@0.4,@0.6,@0.8];
    
    gradientLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor,
                             (__bridge id)[UIColor blueColor].CGColor,
                             (__bridge id)[UIColor yellowColor].CGColor];
    gradientLayer.frame = self.view.bounds;
    
    [self.view.layer addSublayer:gradientLayer];
    // Do any additional setup after loading the view.
}

+ (NSString *)routePath {
    return @"Gradient";
}

+ (void)handleRequestWithParameters:(id)parameters topViewController:(UIViewController *)topViewController completionHandler:(void (^)(void))completionHandler passBackHandler:(void (^)(id _Nonnull))passBackHandler {
    PSGradientController *part = [PSGradientController new];
    [topViewController.navigationController pushViewController:part animated:YES];
}

@end
