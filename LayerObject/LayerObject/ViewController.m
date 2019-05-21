//
//  ViewController.m
//  LayerObject
//
//  Created by Peng on 2019/5/17.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"
#import "Layer/PSLayerLabel.h"
#import "Layer/PSShapeLayer.h"
#import "Layer/PSGradientLayer.h"

@interface ViewController ()

@property (nonatomic, strong) PSLayerLabel *layerLabel;
@property (nonatomic, strong) PSShapeLayer *shapeLayer;
@property (nonatomic, strong) PSGradientLayer *gradientLayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layerLabel = [[PSLayerLabel alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, 100) text:@"自定义LayerLabel"];
    [self.view addSubview:self.layerLabel];
    self.shapeLayer = [[PSShapeLayer alloc] initWithFrame:CGRectMake(0, 44 + 100, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.view addSubview:self.shapeLayer];
    self.gradientLayer = [[PSGradientLayer alloc] initWithFrame:CGRectMake(0, self.shapeLayer.frame.size.height + self.shapeLayer.frame.origin.y, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.view addSubview:self.gradientLayer];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
