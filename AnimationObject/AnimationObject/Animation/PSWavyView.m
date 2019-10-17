//
//  PSWavyView.m
//  AnimationObject
//
//  Created by Peng on 2019/7/8.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSWavyView.h"
#import "PSDefines.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

@interface PSProxy: NSObject
@property (weak, nonatomic) id executor;
@end

@implementation PSProxy

-(void)callback{
    [_executor performSelector:@selector(wavy)];
}

@end

@interface PSWavyView()

@property (nonatomic, strong) CADisplayLink *timer;

@property (nonatomic, strong) CAShapeLayer *wavy1Layer;

@property (nonatomic, strong) CAShapeLayer *wavy2Layer;

@property (nonatomic, strong) CAShapeLayer *wavy3Layer;

@property (nonatomic, strong) CAGradientLayer *bgGradientLayer;

@property (nonatomic, assign) CGFloat offset;

@property (nonatomic, strong) UIColor *wavyColor;

@end

@implementation PSWavyView


- (void)awakeFromNib {
    [super awakeFromNib];
    [self initData];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData{
    //初始化
    self.wavySpeed = 0.5;
    self.wavyCurvature = 1.5;
    self.wavyHeight = 4;
    //    self.wavy1Color =  [ZHColor(31, 169, 230, 1) colorWithAlphaComponent:0.3];
    
    // 背景色
    self.bgGradientLayer.colors = @[(id)ZHColor(245, 0, 0, 1).CGColor,
                                    (id)ZHColor(245, 50, 50, 1).CGColor,
                                    (id)ZHColor(245, 55, 55, 1).CGColor,
                                    (id)ZHColor(245, 60, 60, 1).CGColor,
                                    (id)ZHColor(245, 70, 70, 1).CGColor,
                                    (id)ZHColor(245, 80, 80, 1).CGColor,
                                    (id)ZHColor(245, 100, 100, 1).CGColor,
                                    (id)ZHColor(245, 120, 120, 1).CGColor,
                                    (id)ZHColor(245, 140, 140, 1).CGColor,
                                    (id)ZHColor(245, 190, 190, 1).CGColor,
                                    (id)ZHColor(245, 240, 240, 1).CGColor];
    
    [self.timer setPaused:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIColor*)wavyColor{
    if (!_wavyColor) {
        self.wavyColor = [_wavycolor colorWithAlphaComponent:0.3];
    }
    return _wavyColor;
}

- (CAGradientLayer *)bgGradientLayer{
    if (!_bgGradientLayer) {
        _bgGradientLayer = [CAGradientLayer layer];
        _bgGradientLayer.frame = self.bounds;
        _bgGradientLayer.startPoint = CGPointMake(.5, 0);
        _bgGradientLayer.endPoint = CGPointMake(.5, 1);
        
        [self.layer addSublayer:_bgGradientLayer];
    }
    return _bgGradientLayer;
}
- (CAShapeLayer *)wavy1Layer{
    
    if (!_wavy1Layer) {
        _wavy1Layer = [self getwavyLayer];
        [self.layer addSublayer:_wavy1Layer];
    }
    return _wavy1Layer;
}

- (CAShapeLayer *)wavy2Layer{
    
    if (!_wavy2Layer) {
        _wavy2Layer = [self getwavyLayer];
        [self.layer addSublayer:_wavy2Layer];
    }
    return _wavy2Layer;
}
- (CAShapeLayer *)wavy3Layer{
    if (!_wavy3Layer) {
        _wavy3Layer = [self getwavyLayer];
        [self.layer addSublayer:_wavy3Layer];
    }
    return _wavy3Layer;
}

- (CAShapeLayer *)getwavyLayer{
    
    CAShapeLayer *wavyLayer = [CAShapeLayer layer];
    CGRect frame = [self bounds];
    frame.origin.y = frame.size.height-self.wavyHeight;
    frame.size.height = self.wavyHeight;
    wavyLayer.frame = frame;
    wavyLayer.fillColor = self.wavyColor.CGColor;
    return wavyLayer;
}
- (CADisplayLink *)timer{
    if (!_timer) {
        PSProxy *proxy = [[PSProxy alloc] init];
        proxy.executor = self;
        _timer = [CADisplayLink displayLinkWithTarget:proxy selector:@selector(callback)];
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)setwavyHeight:(CGFloat)wavyHeight{
    _wavyHeight = wavyHeight;
    
    CGRect frame = [self bounds];
    frame.origin.y = frame.size.height-self.wavyHeight;
    frame.size.height = self.wavyHeight;
    _wavy1Layer.frame = frame;
    
    CGRect frame1 = [self bounds];
    frame1.origin.y = frame1.size.height-self.wavyHeight;
    frame1.size.height = self.wavyHeight;
    _wavy2Layer.frame = frame1;
    
}

- (void)startWavyAnimation{
    
    self.timer.paused = NO;
}

- (void)stopWavyAnimation{
    
    self.timer.paused = YES;
    [self.timer invalidate];
    self.timer = nil;
}



- (void)wavy{
    
    self.offset += self.wavySpeed;
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = self.wavyHeight;
    
    //path1
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathMoveToPoint(path1, NULL, 0, height);
    CGFloat path1y = 0.f;
    //path2
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGPathMoveToPoint(path2, NULL, 0, height);
    CGFloat path2Y = 0.f;
    //path2
    CGMutablePathRef path3 = CGPathCreateMutable();
    CGPathMoveToPoint(path3, NULL, 0, height);
    CGFloat path3Y = 0.f;
    
    for (CGFloat x = 0.f; x <= width ; x++) {
        path1y = height * sinf([self getSinfWithPercent:5.0f widthX:x]);
        CGPathAddLineToPoint(path1, NULL, x, path1y);
        
        path2Y = height * sinf([self getSinfWithPercent:3.2f widthX:x]);
        CGPathAddLineToPoint(path2, NULL, x, path2Y);
        
        path3Y = height * sinf([self getSinfWithPercent:2.0f widthX:x]);
        CGPathAddLineToPoint(path3, NULL, x, path3Y);
    }
    
    //变化的中间Y值
    CGFloat centX = self.bounds.size.width/2;
    CGFloat CentY = height * sinf(0.01 * self.wavyCurvature *centX  + self.offset * 0.045);
    if (self.wavyBlock) {
        self.wavyBlock(CentY);
    }
    
    CGPathAddLineToPoint(path1, NULL, width, height);
    CGPathAddLineToPoint(path1, NULL, 0, height);
    CGPathCloseSubpath(path1);
    self.wavy1Layer.path = path1;
    self.wavy1Layer.fillColor = self.wavyColor.CGColor;
    CGPathRelease(path1);
    
    CGPathAddLineToPoint(path2, NULL, width, height);
    CGPathAddLineToPoint(path2, NULL, 0, height);
    CGPathCloseSubpath(path2);
    self.wavy2Layer.path = path2;
    self.wavy2Layer.fillColor = self.wavyColor.CGColor;
    CGPathRelease(path2);
    
    CGPathAddLineToPoint(path3, NULL, width, height);
    CGPathAddLineToPoint(path3, NULL, 0, height);
    CGPathCloseSubpath(path3);
    self.wavy3Layer.path = path3;
    self.wavy3Layer.fillColor = self.wavyColor.CGColor;
    CGPathRelease(path3);
    
}

- (float)getSinfWithPercent:(float)percent widthX:(CGFloat)widthX{
    return (self.wavyCurvature * widthX + self.offset * percent)/100;
}

#pragma clang diagnostic pop

@end
