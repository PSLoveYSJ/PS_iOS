//
//  PSHitTabBar.m
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/10.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSHitTabBar.h"
#import "PSTabBarItem.h"
#import "PSTabBar.h"

@implementation PSHitTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (!self.isHidden) {
        for (UIView *subView in self.subviews) {
            CGPoint spoint = [subView convertPoint:point fromView:self];
            if (spoint.y < 0) { // 判断是否是凸出图标
                if ([subView isKindOfClass:[PSTabBar class]]) {
                    // 遍历子视图TabBar的子视图
                    for (UIView *tabBarItem in subView.subviews) {
                        // 并且这个视图类属于Item
                        if ([tabBarItem isKindOfClass:[PSTabBarItem class]]) {
                            // 判断点击点是否位于按钮内
                            if (CGRectContainsPoint(tabBarItem.frame, spoint)) {
                                // 触发事件传达给item
                                return tabBarItem;
                            }
                        }
                    }
                }
            }
        }
        return view;
    }
    return view;
}

@end
