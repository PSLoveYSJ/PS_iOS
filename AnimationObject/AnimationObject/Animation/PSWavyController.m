//
//  PSWavyController.m
//  AnimationObject
//
//  Created by Peng on 2019/7/8.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSWavyController.h"
#import "PSWavyView.h"

@interface PSWavyController ()

@end

@implementation PSWavyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    PSWavyView *wavyView =[[PSWavyView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    wavyView.wavyHeight = 15;
    wavyView.wavySpeed = .5;
    wavyView.wavycolor = [UIColor blackColor];
    [wavyView startWavyAnimation];
    [self.view addSubview:wavyView];
    // Do any additional setup after loading the view.
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
