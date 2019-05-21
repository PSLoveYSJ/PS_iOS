//
//  PSTransitionHeader.h
//  PSTransition
//
//  Created by ShuaiPeng on 2017/9/13.
//  Copyright © 2017年 隔壁老王. All rights reserved.
//

#ifndef PSTransitionHeader_h
#define PSTransitionHeader_h

typedef  enum {
    PSTransitionModalPush,
    PSTransitionModalPop,
    PSTransitionModalPresent,
    PSTransitionModalDismiss
} PSTransitionModal;

/** 转场动画 */
typedef enum {
    PSTransitionMethodMoveLeft, // 往左
    PSTransitionMethodMoveRight, // 往右
    PSTransitionMethodMoveTop, // 往上
    PSTransitionMethodMoveBottom, // 往下
    PSTransitionMethodScale, // 缩放
    PSTransitionMethodOppositeFlipLeft, //  斜翻转
    PSTransitionMethodOppositeFlipRight, // 斜翻转返回
    PSTransitionMethodFlipLeft, // 往左翻
    PSTransitionMethodFlipRigth, // 右翻转
    PSTransitionMethodFlipTop, // 上翻转
    PSTransitionMethodFlipBottom, // 下翻转
    PSTransitionMethodDrawer, // 抽屉？
    PSTransitionMethodWindRight, // 风吹 右
    PSTransitionMethodWindLeft, // 风吹左
} PSTransitionMethod;


#endif /* PSTransitionHeader_h */
