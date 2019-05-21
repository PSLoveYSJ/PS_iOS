//
//  PSTransitionMove.m
//  PSTransition
//
//  Created by ShuaiPeng on 2017/9/13.
//  Copyright © 2017年 隔壁老王. All rights reserved.
//

#import "PSTransitionMethodClass.h"

static int const _flip_Opposite_line = 6; // 有几列
static int const _flip_line = 6;  // 有几列
static int const _flip_row  = 8; // 有几行
static int const _drawer_row = 8;  // 有几行

#define PS_WIDTH [UIScreen mainScreen].bounds.size.width
#define PS_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface PSTransitionMethodClass() {
    CGFloat _width;  // 宽度
    int _flip_Opposite_totalCount; // 所有数量
    int _flip_Opposite_finishedCounter; // 结束数量
    int _flip_totlaCount;
    int _flip_finishedCounter;
    NSInteger _transitionnumPerRow; // 几行
    NSInteger _transitiontotalNum;// 总共的number
    NSInteger _transition_randomPick;
    CGPoint _transition_pickedCenter; // 开始中心
    NSMutableArray *_transition_snapShots; // 截图
    NSMutableArray *_transition_flipedViews; // 弹性view
    id<UIViewControllerContextTransitioning> currentTransitioning; // 当前transition
}



@end


@implementation PSTransitionMethodClass

- (NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.psTransitonDuration;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.psTransitionModal ) {
        case PSTransitionModalPush:
        {
            [self ps_setPushTransition:transitionContext and:self.psTransitionMethod];
        }
            break;
        case PSTransitionModalPop:
        {
            [self ps_setPopTransition:transitionContext and:self.psTransitionMethod];
        }
            break;
        case PSTransitionModalPresent:
        {
            [self ps_setPresentTransition:transitionContext and:self.psTransitionMethod];
        }
            break;
        case PSTransitionModalDismiss:
        {
            [self ps_setDismissTransition:transitionContext and:self.psTransitionMethod];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark --// ************************** push 方法 **************************
- (void) ps_setPushTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod {
    switch (transitionMethod) {
        case PSTransitionMethodMoveLeft:case PSTransitionMethodMoveRight:case PSTransitionMethodMoveTop:case PSTransitionMethodMoveBottom:
            [self psMoveTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodScale:
            [self psScaleTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodOppositeFlipLeft: case PSTransitionMethodOppositeFlipRight:
            [self psOppositeFlipTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodFlipTop:case PSTransitionMethodFlipBottom:case PSTransitionMethodFlipRigth:case PSTransitionMethodFlipLeft:
            [self psFlipTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodDrawer:
            [self psDrawerTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodWindRight: case PSTransitionMethodWindLeft:
            [self psWindTransition:transitionContext and:transitionMethod];
            break;
        default:
            break;
    }
}

#pragma mark --// ************************** pop 方法 **************************
- (void) ps_setPopTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod {
    switch (transitionMethod) {
        case PSTransitionMethodMoveLeft:case PSTransitionMethodMoveRight:case PSTransitionMethodMoveTop:case PSTransitionMethodMoveBottom:
            [self psMoveTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodScale:
            [self psScaleTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodOppositeFlipLeft: case PSTransitionMethodOppositeFlipRight:
            [self psOppositeFlipTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodFlipTop:case PSTransitionMethodFlipBottom:case PSTransitionMethodFlipRigth:case PSTransitionMethodFlipLeft:
            [self psFlipTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodDrawer:
            [self psDrawerTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodWindRight: case PSTransitionMethodWindLeft:
            [self psWindTransition:transitionContext and:transitionMethod];
            break;
        default:
            break;
    }
}

#pragma mark --// ************************** present 方法 **************************
- (void) ps_setPresentTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod {
    switch (transitionMethod) {
        case PSTransitionMethodMoveLeft:case PSTransitionMethodMoveRight:case PSTransitionMethodMoveTop:case PSTransitionMethodMoveBottom:
            [self psMoveTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodScale:
            [self psScaleTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodOppositeFlipLeft: case PSTransitionMethodOppositeFlipRight:
            [self psOppositeFlipTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodFlipTop:case PSTransitionMethodFlipBottom:case PSTransitionMethodFlipRigth:case PSTransitionMethodFlipLeft:
            [self psFlipTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodDrawer:
            [self psDrawerTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodWindRight: case PSTransitionMethodWindLeft:
            [self psWindTransition:transitionContext and:transitionMethod];
            break;
            break;
        default:
            break;
    }
}

#pragma mark --// ************************** dismiss 方法 **************************
- (void) ps_setDismissTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod {
    switch (transitionMethod) {
        case PSTransitionMethodMoveLeft:case PSTransitionMethodMoveRight:case PSTransitionMethodMoveTop:case PSTransitionMethodMoveBottom:
            [self psMoveTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodScale:
            [self psScaleTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodOppositeFlipLeft: case PSTransitionMethodOppositeFlipRight:
            [self psOppositeFlipTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodFlipTop:case PSTransitionMethodFlipBottom:case PSTransitionMethodFlipRigth:case PSTransitionMethodFlipLeft:
            [self psFlipTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodDrawer:
            [self psDrawerTransition:transitionContext and:transitionMethod];
            break;
        case PSTransitionMethodWindRight: case PSTransitionMethodWindLeft:
            [self psWindTransition:transitionContext and:transitionMethod];
            break;
        default:
            break;
    }
}


#pragma mark --// ************************** implement method **************************
#pragma mark --// ************************** move  **************************
- (void) psMoveTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod {
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    //自定义动画
    switch (transitionMethod) {
        case PSTransitionMethodMoveLeft:
            toViewController.view.transform = CGAffineTransformMakeTranslation(PS_WIDTH, 0);
            break;
        case PSTransitionMethodMoveRight:
            toViewController.view.transform = CGAffineTransformMakeTranslation(- PS_WIDTH, 0);
            break;
        case PSTransitionMethodMoveTop:
            toViewController.view.transform = CGAffineTransformMakeTranslation(0, PS_HEIGHT);
            break;
        case PSTransitionMethodMoveBottom:
            toViewController.view.transform = CGAffineTransformMakeTranslation(0, - PS_HEIGHT);
            break;
        default:
            break;
    }
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        switch (transitionMethod) {
        case PSTransitionMethodMoveLeft:
            fromViewController.view.transform = CGAffineTransformMakeTranslation(- PS_WIDTH, 0);
            break;
        case PSTransitionMethodMoveRight:
            fromViewController.view.transform = CGAffineTransformMakeTranslation(PS_WIDTH, 0);
            break;
        case PSTransitionMethodMoveTop:
            fromViewController.view.transform = CGAffineTransformMakeTranslation(0, - PS_HEIGHT);
            break;
        case PSTransitionMethodMoveBottom:
            fromViewController.view.transform = CGAffineTransformMakeTranslation(0, PS_HEIGHT);
            break;
        default:
            break;
    }
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
#pragma mark --// ************************** Scale  **************************
- (void) psScaleTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC =[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    UIView * fromView = fromVC.view;
    UIView * toView = toVC.view;
    [containerView addSubview:toView];
    [[transitionContext containerView] bringSubviewToFront:fromView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromView.alpha = 0;
        fromView.transform = CGAffineTransformMakeScale(0.2, 0.2);
        toView.alpha = 1;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformMakeScale(1, 1);
        [transitionContext completeTransition:YES];
    }];
}
#pragma mark --// ************************** Opposite Flip  **************************
- (void) psOppositeFlipTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod{
    currentTransitioning = transitionContext;
    UIViewController *toVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    UIView * fromView = fromVC.view;
    UIView * toView = toVC.view;
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    _flip_Opposite_totalCount = 0;
    _flip_Opposite_finishedCounter = 0;
    CGSize size = toView.frame.size;
    
    NSMutableArray *tempSnapshots = [NSMutableArray array];
    
    CGFloat xFactor = _flip_Opposite_line;
    CGFloat yFactor = xFactor *size.height / size.width;
    
    NSInteger numPerRow = 0;
    NSInteger totalNum = 0;
    
    UIView *fromViewSnapshot = [fromView snapshotViewAfterScreenUpdates:NO];
    
    for (CGFloat y = 0; y < size.height; y+= size.height / yFactor) {
        numPerRow ++;
        for (CGFloat x = size.width; x >= 0; x -= size.width / xFactor) {
            totalNum ++;
            CGRect snapshotRegion = CGRectMake(x, y, size.width / xFactor, size.height / yFactor);
            UIView *snapshot = [fromViewSnapshot resizableSnapshotViewFromRect:snapshotRegion afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            snapshot.frame = snapshotRegion;
            [containerView addSubview:snapshot];
            [tempSnapshots addObject:snapshot];
            _flip_Opposite_totalCount++;
        }
    }
    [containerView sendSubviewToBack:fromView];
    switch (self.psTransitionMethod) {
        case PSTransitionMethodOppositeFlipLeft:
        {
            for(int i = 0 ; i < numPerRow ; i ++){
                NSTimeInterval delay = i * 0.1f;
                for(int j = 0 ; j < totalNum/numPerRow ; j ++){
                    [self performSelector:@selector(ps_triggerFlip:) withObject:[tempSnapshots objectAtIndex:(j + i * totalNum/numPerRow)] afterDelay:delay];
                    delay += 0.1f;
                }
            }
        }
            break;
        case PSTransitionMethodOppositeFlipRight:
        {
            for(int i = 0 ; i < numPerRow ; i ++){
                NSTimeInterval delay = i * 0.1f;
                for(int j = 0; j < totalNum/ numPerRow; j++){
                    NSLog(@"%ld",totalNum - i * (totalNum/ numPerRow) - j - 1);
                    [self performSelector:@selector(ps_triggerFlip:) withObject:[tempSnapshots objectAtIndex:(totalNum - i * (totalNum/ numPerRow)  - j - 1)] afterDelay:delay];
                    delay += 0.1f;
                }
            }
        }
            break;
        default:
            break;
    }
}
/** 动画 */
- (void) ps_triggerFlip:(UIView *) view {
    CGFloat margin = 1;
    view.layer.anchorPoint = CGPointMake(0, 0.5f);
    CGRect frame = view.layer.frame;
    view.layer.frame = CGRectMake(frame.origin.x - frame.size.width/2 + margin, frame.origin.y + margin, frame.size.width - margin * 2, frame.size.height - margin * 2);
    [UIView animateWithDuration:[self transitionDuration:currentTransitioning] delay:0 options:0 animations:^{
        view.layer.transform = [self getTransForm3DWithAngle:-M_PI_2];
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        self->_flip_Opposite_finishedCounter ++;
        if(self->_flip_Opposite_finishedCounter == self->_flip_Opposite_totalCount){
            [self->currentTransitioning completeTransition:![self->currentTransitioning transitionWasCancelled]];
        }
    }];
}
-(CATransform3D)getTransForm3DWithAngle:(CGFloat)angle{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002f;
    switch (self.psTransitionMethod) {
        case PSTransitionMethodOppositeFlipLeft:
            transform = CATransform3DRotate(transform,angle,0,1,0);
            break;
        case PSTransitionMethodOppositeFlipRight:
            transform = CATransform3DRotate(transform,-angle,0,-1,0);
            break;
        default:
            break;
    }
    return transform;
}
#pragma mark --// **************************  Flip  **************************
- (void) psFlipTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod{
    currentTransitioning = transitionContext;
    UIViewController *toVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    UIView * fromView = fromVC.view;
    UIView * toView = toVC.view;
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    _flip_totlaCount = 0;
    _flip_finishedCounter = 0;
    CGSize size = toView.frame.size;
    
    NSMutableArray *tempSnapshots = [NSMutableArray array];
    
    UIView *fromViewSnapshot = [fromView snapshotViewAfterScreenUpdates:NO];
    switch (self.psTransitionMethod) {
        case PSTransitionMethodFlipLeft: case PSTransitionMethodFlipRigth:
        {
            for (CGFloat x = size.width; x >= 0; x -= size.width / _flip_line) {
                CGRect snapshotRegion = CGRectMake(x, 0, size.width / _flip_line, size.height);
                UIView *snapshot = [fromViewSnapshot resizableSnapshotViewFromRect:snapshotRegion afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
                snapshot.frame = snapshotRegion;
                [containerView addSubview:snapshot];
                [tempSnapshots addObject:snapshot];
                _flip_totlaCount++;
            }
        }
            break;
        case PSTransitionMethodFlipTop: case PSTransitionMethodFlipBottom:
        {
            for (CGFloat y = size.height; y >= 0; y -= size.height / _flip_row) {
                CGRect snapshotRegion = CGRectMake(0, y, size.width , size.height / _flip_row);
                UIView *snapshot = [fromViewSnapshot resizableSnapshotViewFromRect:snapshotRegion afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
                snapshot.frame = snapshotRegion;
                [containerView addSubview:snapshot];
                [tempSnapshots addObject:snapshot];
                _flip_totlaCount++;
            }
        }
            break;
        default:
            break;
    }
    [containerView sendSubviewToBack:fromView];
    switch (self.psTransitionMethod) {
        case PSTransitionMethodFlipLeft:
        {
            for (int i = 0; i <= _flip_line; i++) {
                NSTimeInterval delay = i * 0.1f;
                [self performSelector:@selector(ps_Flip:) withObject:[tempSnapshots objectAtIndex:_flip_line - i] afterDelay:delay];
                delay += 0.1;
            }
        }
            break;
        case PSTransitionMethodFlipRigth:
        {
            for (int i = 0; i <= _flip_line; i++) {
                NSTimeInterval delay = i * 0.1f;
                [self performSelector:@selector(ps_Flip:) withObject:[tempSnapshots objectAtIndex:i] afterDelay:delay];
                delay += 0.1;
            }
        }
            break;
        case PSTransitionMethodFlipTop:
        {
            for (int i = 0; i <= _flip_row; i++) {
                NSTimeInterval delay = i * 0.1f;
                [self performSelector:@selector(ps_Flip:) withObject:[tempSnapshots objectAtIndex:_flip_row - i] afterDelay:delay];
                delay += 0.1;
            }
        }
            break;
        case PSTransitionMethodFlipBottom:
        {
            for (int i = 0; i <= _flip_row; i++) {
                NSTimeInterval delay = i * 0.1f;
                [self performSelector:@selector(ps_Flip:) withObject:[tempSnapshots objectAtIndex:i] afterDelay:delay];
                delay += 0.1;
            }
        }
            break;
        default:
            break;
    }

}
- (void) ps_Flip:(UIView *) view {
    CGFloat margin = 1;
    switch (self.psTransitionMethod) {
        case PSTransitionMethodFlipLeft:
            view.layer.anchorPoint = CGPointMake(0.0f, 0.5f);
            break;
        case PSTransitionMethodFlipRigth:
            view.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
            break;
        case PSTransitionMethodFlipTop:
            view.layer.anchorPoint = CGPointMake(0.5f, 0.0f);
            break;
        case PSTransitionMethodFlipBottom:
            view.layer.anchorPoint = CGPointMake(0.5f, 1.0f);
            break;
        default:
            break;
    }

    CGRect frame = view.layer.frame;
    view.layer.frame = CGRectMake(frame.origin.x - frame.size.width/2 + margin, frame.origin.y + margin, frame.size.width - margin * 2, frame.size.height - margin * 2);
    [UIView animateWithDuration:[self transitionDuration:currentTransitioning] delay:0 options:0 animations:^{
        view.layer.transform = [self ps_FlipgetTransForm3DWithAngle:-M_PI_2];
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        self->_flip_finishedCounter ++;
        if(self->_flip_finishedCounter == self->_flip_totlaCount){
            [self->currentTransitioning completeTransition:![self->currentTransitioning transitionWasCancelled]];
        }
    }];
}
-(CATransform3D)ps_FlipgetTransForm3DWithAngle:(CGFloat)angle{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002f;
    switch (self.psTransitionMethod) {
        case PSTransitionMethodFlipLeft:
            transform = CATransform3DRotate(transform,angle,0,1,0);
            break;
        case PSTransitionMethodFlipRigth:
            transform = CATransform3DRotate(transform,-angle,0,1,0);
            break;
        case PSTransitionMethodFlipTop:
            transform = CATransform3DRotate(transform,angle,-1,0,0);
            break;
        case PSTransitionMethodFlipBottom:
            transform = CATransform3DRotate(transform,-angle,-1,0,0);
            break;
        default:
            break;
    }
    return transform;
}
#pragma mark --// **************************  Drawer  **************************

- (void) psDrawerTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod {
    currentTransitioning = transitionContext;
    UIViewController *toVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    UIView * fromView = fromVC.view;
    UIView * toView = toVC.view;
    _flip_totlaCount = 0;
    _flip_finishedCounter = 0;
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    
    if (_transition_snapShots != nil) {
        [_transition_snapShots removeAllObjects];
    } else {
        _transition_snapShots = [NSMutableArray array];
    }
    
    CGSize size = toView.frame.size;
    
    CGFloat xFactor = _drawer_row;
    CGFloat yFactor = xFactor * size.height / size.width;
    
    int rowNun = 0;
    _transitiontotalNum = 0;
    UIView *fromViewSnapshot = [fromView snapshotViewAfterScreenUpdates:NO];
    for (CGFloat y = 0; y < size.height; y += size.height / yFactor) {
        rowNun ++;
        for(CGFloat x = 0; x < size.width; x += size.width / xFactor){
            _transitiontotalNum ++;
            CGRect snapshotRegion = CGRectMake(x, y, size.width / xFactor, size.height / yFactor);
            UIView *snapshot = [fromViewSnapshot resizableSnapshotViewFromRect:snapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            snapshot.frame = snapshotRegion;
            snapshot.tag = (_transitiontotalNum - 1);
            [containerView addSubview:snapshot];
            [_transition_snapShots addObject:snapshot];
            _flip_totlaCount ++;
        }
    }
    _transitionnumPerRow = _transitiontotalNum / rowNun;
    [containerView sendSubviewToBack:fromView];
    if (_transition_flipedViews != nil) {
        [_transition_flipedViews removeAllObjects];
    } else {
        _transition_flipedViews = [NSMutableArray array];
    }
    _transition_randomPick = rand() % _transitiontotalNum;
    UIView *pickedView = [_transition_snapShots objectAtIndex:_transition_randomPick];
    _transition_pickedCenter = pickedView.center;
    [pickedView removeFromSuperview];
    [_transition_flipedViews addObject:[NSNumber numberWithInteger:_transition_randomPick]];
    _flip_finishedCounter = 1;
    [self ps_drawerTriggerFlip];
}
- (void) ps_drawerTriggerFlip {
    NSMutableArray * addFlip = [NSMutableArray new];
    NSMutableSet * addedSet = [NSMutableSet new];
    for (NSNumber *flipped in _transition_flipedViews) {
        NSInteger index = [flipped integerValue];
        if (index % _transitionnumPerRow > 0) {
            if (![_transition_flipedViews containsObject:[NSNumber numberWithInteger:(index - 1)]]) {
                if (![addedSet containsObject:[NSNumber numberWithInteger:(index - 1)]]) {
                    [addedSet addObject:[NSNumber numberWithInteger:(index-1)]];
                    [addFlip addObject:[_transition_snapShots objectAtIndex:index-1]];
                }
            }
        }
        if(index % _transitionnumPerRow < (_transitionnumPerRow - 1)){
            if(![_transition_flipedViews containsObject:[NSNumber numberWithInteger:(index+1)]]){
                if(![addedSet containsObject:[NSNumber numberWithInteger:(index+1)]]){
                    [addedSet addObject:[NSNumber numberWithInteger:(index+1)]];
                    [addFlip addObject:[_transition_snapShots objectAtIndex:index+1]];
                }
            }
        }
        if(index / _transitionnumPerRow >= 1){
            if(![_transition_flipedViews containsObject:[NSNumber numberWithInteger:(index-_transitionnumPerRow)]]){
                if(![addedSet containsObject:[NSNumber numberWithInteger:(index-_transitionnumPerRow)]]){
                    [addedSet addObject:[NSNumber numberWithInteger:(index-_transitionnumPerRow)]];
                    [addFlip addObject:[_transition_snapShots objectAtIndex:index-_transitionnumPerRow]];
                }
            }
        }
        if(index < _transitiontotalNum - _transitionnumPerRow){
            if(![_transition_flipedViews containsObject:[NSNumber numberWithInteger:(index+_transitionnumPerRow)]]){
                if(![addedSet containsObject:[NSNumber numberWithInteger:(index+_transitionnumPerRow)]]){
                    [addedSet addObject:[NSNumber numberWithInteger:(index+_transitionnumPerRow)]];
                    [addFlip addObject:[_transition_snapShots objectAtIndex:index+_transitionnumPerRow]];
                }
            }
        }
    }
    for(UIView * added in addFlip){
        [self ps_drawerTriggerFlip:added];
        [_transition_flipedViews addObject:[NSNumber numberWithInteger:added.tag]];
    }
    [self performSelector:@selector(ps_drawerTriggerFlip) withObject:nil afterDelay:0.05f];
}

- (void) ps_drawerTriggerFlip:(UIView *) view {
    CGFloat margin = 1;
    CGRect frame = view.frame;
    view.frame = CGRectMake(frame.origin.x + margin, frame.origin.y + margin, frame.size.width - margin * 2, frame.size.height - margin * 2);
    [UIView animateWithDuration:[self transitionDuration:currentTransitioning] delay:0  usingSpringWithDamping:1 initialSpringVelocity:0 options:0 animations:^{
        view.transform = CGAffineTransformMakeTranslation(self->_transition_pickedCenter.x - view.center.x, self->_transition_pickedCenter.y - view.center.y);
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        self->_flip_finishedCounter ++;
        if(self->_flip_finishedCounter == self->_flip_totlaCount){
            [(UIView*)[self->_transition_snapShots objectAtIndex:self->_transition_randomPick] removeFromSuperview];
            [self->currentTransitioning completeTransition:![self->currentTransitioning transitionWasCancelled]];
        }
    }];
}
#pragma mark --// **************************  Wind 风  **************************
- (void) psWindTransition:(id<UIViewControllerContextTransitioning>)transitionContext and:(PSTransitionMethod) transitionMethod{
    currentTransitioning = transitionContext;
    UIViewController *toVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    UIView * fromView = fromVC.view;
    UIView * toView = toVC.view;
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    _flip_totlaCount = 0;
    _flip_finishedCounter = 0;
    
    CGSize size = toView.frame.size;
    
    if (_transition_snapShots != nil) {
        [_transition_snapShots removeAllObjects];
    } else {
        _transition_snapShots = [NSMutableArray array];
    }
    CGFloat xFactor = _flip_line;
    CGFloat yFactor = xFactor * size.height / size.width;;
    _width = size.width / xFactor;
    _flip_totlaCount = 0;
    _transitionnumPerRow = 0;
    UIView *fromViewSnapshot = [fromView snapshotViewAfterScreenUpdates:NO];
    for (CGFloat y=0; y < size.height; y+= size.height / yFactor) {
        _transitionnumPerRow ++;
        for (CGFloat x = size.width - size.width / xFactor; x >=0; x -=size.width / xFactor){
            _transitiontotalNum ++;
            CGRect snapshotRegion = CGRectMake(x, y, size.width / xFactor, size.height / yFactor);
            UIView *snapshot = [fromViewSnapshot resizableSnapshotViewFromRect:snapshotRegion  afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
            snapshot.frame = snapshotRegion;
            [containerView addSubview:snapshot];
            [_transition_snapShots addObject:snapshot];
            snapshot.tag = _flip_totlaCount;
            _flip_totlaCount ++;
        }
    }
    [containerView sendSubviewToBack:fromView];
    switch (self.psTransitionMethod) {
        case PSTransitionMethodWindRight:
            for(int i = 0 ; i < _transitionnumPerRow ; i ++){
                NSTimeInterval delay = i * 0.1f;
                for(int j = 0 ; j < _flip_totlaCount/_transitionnumPerRow ; j ++){
                    [self performSelector:@selector(ps_windTriggerFlip:) withObject:[_transition_snapShots objectAtIndex:(j + i * _flip_totlaCount/_transitionnumPerRow)] afterDelay:delay];
                    delay += 0.1f;
                }
            }
            break;
        case PSTransitionMethodWindLeft:
            for(int i = 0 ; i < _transitionnumPerRow ; i ++){
                NSTimeInterval delay = i * 0.1f;
                for(int j = _flip_totlaCount/_transitionnumPerRow - 1 ; j >= 0 ; j --){
                    [self performSelector:@selector(ps_windTriggerFlip:) withObject:[_transition_snapShots objectAtIndex:(j + i * _flip_totlaCount/_transitionnumPerRow)] afterDelay:delay];
                    delay += 0.1f;
                }
            }
            break;
        default:
            break;
    }
}
- (void) ps_windTriggerFlip : (UIView *) view {

    CGFloat margin = _width/10;
    CGRect frame = view.layer.frame;
    view.layer.frame = CGRectMake(frame.origin.x + margin, frame.origin.y + margin, frame.size.width - margin * 2, frame.size.height - margin * 2);
    [UIView animateWithDuration:[self transitionDuration:currentTransitioning] delay:0 options:0 animations:^{
        if (self.psTransitionMethod == PSTransitionMethodWindRight) {
            view.layer.transform = [self ps_getWindRightTransForm3DWithAngle:-M_PI_2 offset : frame.origin.x];
        } else if (self.psTransitionMethod == PSTransitionMethodWindLeft) {
            view.layer.transform = [self ps_getWindLeftTransForm3DWithAngle:-M_PI_2 offset:frame.origin.x];
        }
        
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        self->_flip_finishedCounter ++;
        if(self->_flip_finishedCounter == self->_flip_totlaCount){
            [self->currentTransitioning completeTransition:![self->currentTransitioning transitionWasCancelled]];
        }
    }];

}
/** 风右吹 */
-(CATransform3D)ps_getWindRightTransForm3DWithAngle:(CGFloat)angle offset : (CGFloat) offset{
    CATransform3D move = CATransform3DMakeTranslation(0, 0, offset + _width - [UIScreen mainScreen].bounds.size.width);
    CATransform3D back = CATransform3DMakeTranslation(0, 0, _width);
    CATransform3D rotate = CATransform3DMakeRotation(angle, 0, 1, 0);
    CATransform3D mat = CATransform3DConcat(CATransform3DConcat(move, rotate), back);
    return CATransform3DPerspectRight(mat, CGPointZero, 500);
    
}

CATransform3D CATransform3DPerspectRight(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspectiveRight(center, disZ));
}


CATransform3D CATransform3DMakePerspectiveRight(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}
/** 风左吹 */
-(CATransform3D)ps_getWindLeftTransForm3DWithAngle:(CGFloat)angle offset : (CGFloat) offset{
    CATransform3D move = CATransform3DMakeTranslation(0, 0,   offset);
    CATransform3D back = CATransform3DMakeTranslation(0, 0,_width);
    CATransform3D rotate = CATransform3DMakeRotation(-angle, 0, -1, 0);
    CATransform3D mat = CATransform3DConcat(CATransform3DConcat(move, rotate), back);
    return CATransform3DPerspectLeft(mat, CGPointZero, 500);
    
}

CATransform3D CATransform3DPerspectLeft(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspectiveLeft(center, disZ));
}


CATransform3D CATransform3DMakePerspectiveLeft(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}


@end
