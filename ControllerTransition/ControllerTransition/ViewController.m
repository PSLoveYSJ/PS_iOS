//
//  ViewController.m
//  ControllerTransition
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"
#import "PSTransition/PSTransitionDelegate/PSTransitionDelegate.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *controller = [UIViewController new];
    controller.view.backgroundColor = [UIColor redColor];
    PSTransitionDelegate *delegate = [PSTransitionDelegate sharedInstance];
    delegate.psTransitionModal = PSTransitionModalPresent;
    delegate.psTransitionMethod = PSTransitionMethodMoveTop;
    self.transitioningDelegate = delegate;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
