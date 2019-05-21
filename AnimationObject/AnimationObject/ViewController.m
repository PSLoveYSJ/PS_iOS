//
//  ViewController.m
//  AnimationObject
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"
#import "Animation/ViewAnimation.h"
#import "Animation/AffineTransform.h"
#import "Animation/CA3DTransform.h"
#import "Animation/CATransitionAnimation.h"
#import "Animation/KeyAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewAnimation *animation = [[ViewAnimation alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 100)];
    [self.view addSubview:animation];
    
    AffineTransform *affine = [[AffineTransform alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 100)];
    [self.view addSubview:affine];
    
    CA3DTransform *transform3D = [[CA3DTransform alloc] initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.bounds), 100)];
    [self.view addSubview:transform3D];
    
    CATransitionAnimation *caTransition = [[CATransitionAnimation alloc] initWithFrame:CGRectMake(0, 300, CGRectGetWidth(self.view.bounds), 100)];
    [self.view addSubview:caTransition];
    
    KeyAnimation *keyAnimation = [[KeyAnimation alloc] initWithFrame:CGRectMake(0, 400, CGRectGetWidth(self.view.bounds), 100)];
    [self.view addSubview:keyAnimation];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
