//
//  ViewController.m
//  Dispatch
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"
#import "Group/DispatchGroupUse.h"
#import "Semaphore/DispatchSemaphore.h"
#import "Timer/DispatchTimer.h"
#import "DispatchSync/DispatchSync.h"

// 优先级
//#define DISPATCH_QUEUE_PRIORITY_HIGH 2
//#define DISPATCH_QUEUE_PRIORITY_DEFAULT 0
//#define DISPATCH_QUEUE_PRIORITY_LOW (-2)
//#define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
// 优先级
//*  - QOS_CLASS_USER_INTERACTIVE
//*  - QOS_CLASS_USER_INITIATED
//*  - QOS_CLASS_DEFAULT
//*  - QOS_CLASS_UTILITY
//*  - QOS_CLASS_BACKGROUND

// DISPATCH_QUEUE_SERIAL 串行
// DISPATCH_QUEUE_CONCURRENT 并行

@interface ViewController ()

@property (nonatomic, strong) dispatch_source_t source_t;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    DispatchGroupUse *use = [DispatchGroupUse new];
////    [use group_async];
////    [use group_async_f];
////    [use wait];
//    [use enterLeave];
//    DispatchSemaphore *semaphore = [DispatchSemaphore new];
//    [semaphore wait];
//    [semaphore back];
    DispatchSync *sync = [DispatchSync new];
    [sync sync];
//    [sync async];
//    [sync apply];
    

}

- (void) dispatch_timer {
    self.source_t = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    // 设置开始时间
    dispatch_source_set_timer(self.source_t, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(self.source_t, ^{
        // 需要调用的
        NSLog(@"执行的活动");
    });
    
    dispatch_source_set_cancel_handler(self.source_t, ^{
        NSLog(@"哥取消了啊");
    });
    
    // 计时器开始
    dispatch_resume(self.source_t);
    // 取消
    //    dispatch_source_cancel(self.source_t);
    // Do any additional setup after loading the view, typically from a nib.
}


@end
