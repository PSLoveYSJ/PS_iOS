//
//  DispatchGroupUse.m
//  Dispatch
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "DispatchGroupUse.h"

@interface DispatchGroupUse()

@property (nonatomic, strong) dispatch_group_t group_t;

@end

@implementation DispatchGroupUse

- (instancetype) init {
    if (self == [super init]) {
        [self create];
    }
    return self;
}

- (void) create {
    self.group_t = dispatch_group_create();
}

- (void) group_async {
    dispatch_queue_t t = dispatch_queue_create("ddd", nil);
    //将块异步提交到的分派队列调用
    dispatch_group_async(self.group_t,t , ^{
        NSLog(@"异步执行了");
    });
    
    
}

void function_t_use(void *value) {
    
    char *cString = value;
    
    NSLog(@"value is : %@",[NSString stringWithUTF8String:cString]);
}

- (void) group_async_f {
    dispatch_queue_t t = dispatch_queue_create("addd", nil);
    char *cString = "group_async_f";
    dispatch_group_async_f(self.group_t, t,cString , function_t_use);
}

- (void)notify {
    dispatch_queue_t t = dispatch_queue_create("adddd", nil);

    // 当与组关联的所有块都已完成时执行
    dispatch_group_notify(self.group_t, t, ^{
        
    });
}

- (void)enterLeave {
    // 手动指示一个块已进入组 调用此函数表示另一个块通过dispatch_group_async()以外的方法加入了组。对该函数的调用必须使用dispatch_group_leave()进行平衡
    dispatch_group_enter(self.group_t);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_group_leave(self.group_t);
    });
    dispatch_queue_t t = dispatch_queue_create("adddd", nil);
    //
    dispatch_group_notify(self.group_t, t, ^{
       NSLog(@"group enter levave");
    });
    
}

- (void)wait {
    [self group_async];
    [self group_async_f];
    // 同步等待，直到与组关联的所有块都已完成，或者直到指定的超时时间结束
    dispatch_group_wait(self.group_t, 5);
    NSLog(@"等待30秒");
}


@end
