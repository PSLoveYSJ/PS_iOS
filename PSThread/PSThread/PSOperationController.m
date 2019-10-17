//
//  PSOperationController.m
//  PSThread
//
//  Created by Peng on 2019/7/7.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSOperationController.h"

@interface PSOperationController ()



@end

@implementation PSOperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self operation];

}

- (void) operation {
    // Do any additional setup after loading the view.
    NSOperation *firstOperation = [[NSOperation alloc] init];
    NSOperation *operation = [[NSOperation alloc] init];
    [firstOperation setCompletionBlock:^{
        NSLog(@"firstOperation log,%@",[NSThread currentThread]);
    }];
//    operation.queuePriority = NSOperationQueuePriorityNormal; // 队列优先级
//    operation.qualityOfService = NSQualityOfServiceUtility; // 队列质量
    //    [operation waitUntilFinished]; // 阻塞当前线程的执行，直到操作对象完成其任务。
    [operation setCompletionBlock:^{
        NSLog(@"operation log,%@",[NSThread currentThread]); // 新开线程
    }];
    [operation addDependency:firstOperation]; // 添加依赖的话必须先执行依赖线程 否则会报错
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    [queue addOperation:firstOperation];

//    [firstOperation start];
//    [operation start];
    NSLog(@"Current thread%@",[NSThread currentThread]);
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
