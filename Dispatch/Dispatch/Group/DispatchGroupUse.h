//
//  DispatchGroupUse.h
//  Dispatch
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DispatchGroupUse : NSObject

- (void) group_async;
- (void) group_async_f;
- (void) wait;
- (void) notify;
- (void)enterLeave;

@end

NS_ASSUME_NONNULL_END
