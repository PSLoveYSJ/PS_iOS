//
//  DispatchSemaphore.h
//  Dispatch
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DispatchSemaphore : NSObject

- (void) wait;
- (void) back;

@end

NS_ASSUME_NONNULL_END
