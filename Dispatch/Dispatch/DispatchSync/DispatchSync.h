//
//  DispatchSync.h
//  Dispatch
//
//  Created by Peng on 2019/5/28.
//  Copyright © 2019 PengShuai. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DispatchSync : NSObject

- (void)async;
- (void)sync;
- (void)after;
- (void)apply;

@end

NS_ASSUME_NONNULL_END
