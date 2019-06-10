//
//  DispatchSemaphore.m
//  Dispatch
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "DispatchSemaphore.h"

@interface DispatchSemaphore()

@property (nonatomic, strong) dispatch_semaphore_t semphore_t;

@end

@implementation DispatchSemaphore

- (instancetype)init {
    if (self == [super init]) {
        // 创建型号量
        self.semphore_t = dispatch_semaphore_create(1);
    }
    return self;
}

- (void) wait {
    // 等待时间一般是 DISPATCH_TIME_NOW Forver
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_semaphore_wait(self.semphore_t, DISPATCH_TIME_NOW);
        NSLog(@"第一个执行的异步");
        sleep(1);
        dispatch_semaphore_signal(self.semphore_t);
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_semaphore_wait(self.semphore_t, DISPATCH_TIME_NOW);
        NSLog(@"第二个执行的异步");
        dispatch_semaphore_signal(self.semphore_t);
    });
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_semaphore_wait(self.semphore_t, DISPATCH_TIME_NOW);
        NSLog(@"第三个执行的异步");
        sleep(1);
        dispatch_semaphore_signal(self.semphore_t);
    });
    
    
    
}

- (void)back {
//    NSLog(@"5秒钟后信号量回来了");
}

@end
