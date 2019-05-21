//
//  PSShapeLayer.m
//  LayerObject
//
//  Created by Peng on 2019/5/17.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSShapeLayer.h"

@implementation PSShapeLayer

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void) setUpUI {
    //  绘制矢量图形可以实现3D变换效果，渲染效率比CoreGraphics快，超出边界之外也能绘制
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    
    // 该属性定义了笔画路径的子区域。此属性中的值指示完成描边的路径上的相对点，而描边estart属性定义了起始点。值0.0表示路径的开始，值1.0表示路径的结束。中间的值沿路径长度线性解释。 默认1
    shaperLayer.strokeEnd = 1.0;
    // 默认 0
    shaperLayer.strokeStart = 0;
    // 路径颜色
    shaperLayer.strokeColor = [UIColor redColor].CGColor;
    // 默认 10 ， 如果连接样式是kCALineJoinMiter,根据斜接长度除以线宽 如果大于斜接限制 使用斜角绘制路径 否则使用斜角连接线
    shaperLayer.miterLimit = 10;
    // 线宽
    shaperLayer.lineWidth = 2;
    // 指定形状路径的行连接样式kCALineJoinMiter
    // kCALineJoinRound 圆角
    // kCALineJoinBevel 斜角
    shaperLayer.lineJoin = kCALineJoinMiter;
    // 默认0 形状路径的划线阶段。 线破折号阶段指定线开始到破折号模式的深度。
//    shaperLayer.lineDashPhase = 0;
    // 划线时应用于形状路径的破折号图案。
//    shaperLayer.lineDashPattern = @[@""];
    //  填充色
    shaperLayer.fillColor = [UIColor greenColor].CGColor;
    // 默认kCAFillRuleNonZero
    shaperLayer.fillRule = kCAFillRuleNonZero;
    // 默认 kCALineCapButt
    // 指定形状路径的行帽样式
    // kCALineCapButt
    // kCALineCapRound 圆
    // kCALineCapSquare 平方
    shaperLayer.lineCap = kCALineCapButt;
    
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)];
    [bezier addArcWithCenter:CGPointMake(self.bounds.size.width / 2 - 50, self.bounds.size.height / 2) radius:50 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    shaperLayer.path = bezier.CGPath;
    
    [self.layer addSublayer:shaperLayer];
}


@end
