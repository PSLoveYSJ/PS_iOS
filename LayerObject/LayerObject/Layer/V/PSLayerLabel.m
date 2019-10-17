//
//  PSLayerLabel.m
//  LayerObject
//
//  Created by Peng on 2019/5/17.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSLayerLabel.h"

@interface PSLayerLabel()

@property (nonatomic, copy) NSString *contentString; //

@end

@implementation PSLayerLabel

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text {
    if (self == [super initWithFrame:frame]) {
        self.contentString = text;
        self.frame = frame;
        [self setUpUI];
    }
    return self;
}

- (void) setUpUI {
    //  文字层
    CATextLayer *textLayer = [CATextLayer layer];
    // frame
    textLayer.frame = self.bounds;
    // 背景色
    textLayer.backgroundColor = [UIColor groupTableViewBackgroundColor].CGColor;
    //内容layer
    textLayer.string = self.contentString;
    // 字体大小
    textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:30]);
    // 字体颜色
    textLayer.foregroundColor = [UIColor orangeColor].CGColor;
    // 当启用时，用于文本渲染的图形上下文可以量化字形的子像素位置。
//    textLayer.allowsFontSubpixelQuantization = YES;
    // 超界被裁剪 默认NO
    textLayer.wrapped = YES;
    // 对齐方式 居中 左 右  合理的 自然的
    textLayer.alignmentMode = kCAAlignmentCenter;
    // 裁剪方式 末尾 中间 无 开头
    textLayer.truncationMode = kCATruncationEnd;
    // 适应屏幕分辨率，防止像素化导致模糊
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [self.layer addSublayer:textLayer];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
