//
//  PSTransitionDelegate.m
//  PSTransition
//
//  Created by ShuaiPeng on 2017/9/13.
//  Copyright © 2017年 隔壁老王. All rights reserved.
//



#import "PSTransitionDelegate.h"
#import "PSTransitionMethodClass.h"

@interface PSTransitionDelegate()


@end

static PSTransitionDelegate *transiton = nil;

@implementation PSTransitionDelegate

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        transiton = [[self alloc] init];
    });
    return transiton;
}

- (instancetype)init {
    if (self = [super init]) {
        self.psTransitionMethod = PSTransitionMethodMoveLeft;
        self.psTransitionInterval = .3;
    }
    return self;
}
#pragma mark --// navigation delegate 
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        PSTransitionMethodClass *trans = [[PSTransitionMethodClass alloc] init];
        trans.psTransitionModal = PSTransitionModalPush;
        trans.psTransitonDuration = self.psTransitionInterval;
        trans.psTransitionMethod = self.psTransitionMethod;
        return trans;
    } else if (operation == UINavigationControllerOperationPop) {
        PSTransitionMethodClass *trans = [[PSTransitionMethodClass alloc] init];
        trans.psTransitionModal = PSTransitionModalPop;
        trans.psTransitonDuration = self.psTransitionInterval;
        [self ps_setOpposite:trans];
        return trans;
    } else {
        return nil;
    }
}
#pragma mark --// present dismiss delegate
- (id <UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    PSTransitionMethodClass *trans = [[PSTransitionMethodClass alloc] init];
    trans.psTransitionModal = PSTransitionModalPresent;
    trans.psTransitionMethod = self.psTransitionMethod;
    trans.psTransitonDuration = self.psTransitionInterval;
    return trans;
}
- (id <UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController *)dismissed {
    PSTransitionMethodClass *trans = [[PSTransitionMethodClass alloc] init];
    trans.psTransitionModal = PSTransitionModalDismiss;
    trans.psTransitonDuration = self.psTransitionInterval;
    [self ps_setOpposite:trans];
    return trans;
}

- (void) ps_setOpposite:(PSTransitionMethodClass *) trans {
    switch (self.psTransitionMethod) {
        case PSTransitionMethodMoveLeft:
            trans.psTransitionMethod = PSTransitionMethodMoveRight;
            break;
        case PSTransitionMethodMoveRight:
            trans.psTransitionMethod = PSTransitionMethodMoveLeft;
            break;
        case PSTransitionMethodMoveTop:
            trans.psTransitionMethod = PSTransitionMethodMoveBottom;
            break;
        case PSTransitionMethodMoveBottom:
            trans.psTransitionMethod = PSTransitionMethodMoveTop;
            break;
        case PSTransitionMethodOppositeFlipLeft:
            trans.psTransitionMethod = PSTransitionMethodOppositeFlipRight;
            break;
        case PSTransitionMethodOppositeFlipRight:
            trans.psTransitionMethod = PSTransitionMethodOppositeFlipLeft;
            break;
        case PSTransitionMethodFlipLeft:
            trans.psTransitionMethod = PSTransitionMethodFlipRigth;
            break;
        case PSTransitionMethodFlipRigth:
            trans.psTransitionMethod = PSTransitionMethodFlipLeft;
            break;
        case PSTransitionMethodFlipTop:
            trans.psTransitionMethod = PSTransitionMethodFlipBottom;
            break;
        case PSTransitionMethodFlipBottom:
            trans.psTransitionMethod = PSTransitionMethodFlipTop;
            break;
        case PSTransitionMethodWindLeft:
            trans.psTransitionMethod = PSTransitionMethodWindRight;
            break;
        case PSTransitionMethodWindRight:
            trans.psTransitionMethod = PSTransitionMethodWindLeft;
            break;
        default:
            trans.psTransitionMethod = self.psTransitionMethod;
            break;
    }
}
#pragma mark --// ui tabBar delegate



@end
