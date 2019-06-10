//
//  ViewController.m
//  Sudoku
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"
#import "SudokuView/PSSudokuView.h"
#import "SudokuView/PSSudokuConfiguration.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PSSudokuConfiguration *config = [[PSSudokuConfiguration alloc] init];
    config.dataArray = [NSMutableArray arrayWithObjects://小图
                        @"http://wx1.sinaimg.cn/thumbnail/bfc243a3gy1febm7orgqfj20i80ht15x.jpg",
                        @"http://p7.pstatp.com/large/w960/5322000131e01b7a477d",
                        @"http://p7.pstatp.com/large/w960/5321000135125ebb938a",
                        @"http://wx4.sinaimg.cn/mw690/006ZrXHXgy1fsr0qx5cyzg307p06ve81.gif",
                        @"http://wx2.sinaimg.cn/thumbnail/bfc243a3gy1febm7pmnk7j20i70jidwo.jpg",
                                              @"http://wx4.sinaimg.cn/mw690/006ZrXHXgy1fsr0qr99d6g305808wu0x.gif",
                                              @"http://wx3.sinaimg.cn/mw690/006ZrXHXgy1fsr0qo6f9bg30dw074qv5.gif",
                                              @"http://wx4.sinaimg.cn/mw690/006ZrXHXgy1fsr0qmudqwg3096062kjl.gif",
                                              @"http://wx1.sinaimg.cn/thumbnail/bfc243a3gy1febm7n9eorj20i60hsann.jpg",
                        @"http://wx3.sinaimg.cn/mw690/006ZrXHXgy1fsr0qy8cp5g306z05mqqo.gif",nil];
    PSSudokuView *sudoView = [PSSudokuView ps_sudokuViewWith:config];
    sudoView.frame = CGRectMake(0, 0, self.view.frame.size.width, sudoView.ps_maxHeight);
    [self.view addSubview:sudoView];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
