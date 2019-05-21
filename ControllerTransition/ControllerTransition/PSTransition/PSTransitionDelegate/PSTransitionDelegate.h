//
//  PSTransitionDelegate.h
//  PSTransition
//
//  Created by ShuaiPeng on 2017/9/13.
//  Copyright © 2017年 隔壁老王. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

#import "PSTransitionHeader.h"

/**
 
 push 定义 self.navigationController.delegate = [PSTransitionDelegate sharedInstance]
 
 present self.transitioningDelegate = [PSTransitionDelegate sharedInstance]
 
 */

@interface PSTransitionDelegate : NSObject<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate,UITabBarControllerDelegate>
//* 默认是push推送类型
@property (nonatomic, assign) PSTransitionModal psTransitionModal;
/** 默认是往左 */
@property (nonatomic, assign) PSTransitionMethod psTransitionMethod;
/** 时间间隔 */
@property (nonatomic, assign) NSTimeInterval psTransitionInterval;


+ (instancetype) sharedInstance;

@end
