//
//  DispatchSync.m
//  Dispatch
//
//  Created by Peng on 2019/5/28.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "DispatchSync.h"

@implementation DispatchSync

- (void) async {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"异步执行");
        sleep(1);
        
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"异步执行2"); // 10秒后执行 主线程sleep了
    });
    char *context = "1";
    dispatch_async_f(dispatch_get_main_queue(), context, test);
}

void test(void *content) {
    char *con = content;
    NSLog(@"test = %s %p",con,content);
}

- (void)sync {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"异步执行");
        dispatch_barrier_async(dispatch_get_main_queue(), ^{
            sleep(5);
            //对这个函数的调用总是在块被提交之后立即返回，而不是等待块被调用。当barrier块到达私有并发队列的前端时，不会立即执行它。相反，队列等待，直到当前执行的块完成执行。此时，barrier块将自己执行。在barrier块完成之前，不会执行barrier块之后提交的任何块。
          //  您指定的队列应该是您自己使用dispatch_queue_create函数创建的并发队列。如果传递给此函数的队列是串行队列或全局并发队列之一，则此函数的行为类似于dispatch_async函数。
            // 官方说明大意:在使用栅栏函数时.使用自定义队列才有意义,如果用的是串行队列或者系统提供的全局并发队列,这个栅栏函数的作用等同于一个同步函数的作用
            NSLog(@"栅栏块");
        });
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            sleep(5);
//            NSLog(@"同步执行 未完成前，异步执行不会返回");
//        });
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"异步执行 2");
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"同步执行 2 未完成前，异步执行不会返回");
//        });
    });
}

- (void)after {
    //  创建一个新的分派队列，可以将块提交到该队列。
//    dispatch_queue_create
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"延时z执行");
    });
}

- (void)apply {
    // 并发线程才可以
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"第几次执行 %zu",index);;
    });
}

@end
