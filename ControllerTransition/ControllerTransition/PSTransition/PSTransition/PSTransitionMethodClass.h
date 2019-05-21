//
//  PSTransitionMove.h
//  PSTransition
//
//  Created by ShuaiPeng on 2017/9/13.
//  Copyright © 2017年 隔壁老王. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "PSTransitionHeader.h"


@interface PSTransitionMethodClass : NSObject<UIViewControllerAnimatedTransitioning>

/** 动画模型 默认 push */
@property (nonatomic, assign) PSTransitionModal psTransitionModal;
/** 动画方法 */
@property (nonatomic, assign) PSTransitionMethod psTransitionMethod;
/** 时间间隔 */
@property (nonatomic, assign) NSTimeInterval psTransitonDuration;



@end
