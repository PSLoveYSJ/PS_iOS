//
//  PSLayerContent.m
//  LayerObject
//
//  Created by Peng on 2019/6/11.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSLayerContent.h"

@implementation PSLayerContent


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addLayerContent];
    }
    return self;
}


- (void) addLayerContent {
    self.backgroundColor = [UIColor orangeColor];
    UIImage *image = [UIImage imageNamed:@"girl"];
    self.layer.contents = (__bridge id _Nullable)(image.CGImage);
    self.layer.contentsScale = [UIScreen mainScreen].scale;
    self.layer.contentsGravity = kCAGravityResizeAspect;
    /**
     默认为单元矩形(0.0,0.0,1.0,1.0)。
     
     如果要求单元矩形外的像素，则内容图像的边缘像素将向外扩展。
     
     如果提供了一个空矩形，则结果是未定义的
     */
    self.layer.contentsRect = CGRectMake(0.5, 0.5, 0.5, 0.5);
    /*
     “contentsCenter其实是一个CGRect，它定义了一个固定的边框和一个在图层上可拉伸的区域。 改变contentsCenter的值并不会影响到寄宿图的显示”
     */
//    self.layer.contentsCenter =
    self.layer.masksToBounds = YES;
}


@end
