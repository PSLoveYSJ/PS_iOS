//
//  PSTabBadgeLabel.m
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/7.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSTabBadgeLabel.h"

@implementation PSTabBadgeLabel

#pragma mark &************ init

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUPUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUPUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUPUI];
    }
    return self;
}

- (void) setUPUI {
    self.backgroundColor_ps = [UIColor colorWithRed:255/255.0  green:38/255.0 blue:0 alpha:1];
    self.textColor = [UIColor whiteColor];
    self.textAlignment = NSTextAlignmentCenter;
    self.font = [UIFont boldSystemFontOfSize:10];
    self.clipsToBounds = YES;
    self.hiddenZero = YES;
    self.badgeHeight = 15;
}


#pragma mark &************ setter getter

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.layer.cornerRadius = self.frame.size.height / 2;
}

- (void)setPs_backgroundColor:(UIColor *)ps_backgroundColor {
    ps_backgroundColor = ps_backgroundColor;
    self.backgroundColor = ps_backgroundColor;
}

- (void)setPs_badgeText:(NSString *)ps_badgeText {
    _badgeText = ps_badgeText;
    self.text = _badgeText;
    if (_badgeText.integerValue) { // 是数字 或不为0
        self.hidden = NO;
        if (_badgeText.integerValue > 99) {
            self.text = @"99+";
        }
    } else {
        if (!_badgeText.length) { // 空
            self.hidden = self.hiddenZero;
        }
    }
    CGFloat widths = _badgeText.length * 9 < 20 ? 20 : _badgeText.length * 9;
    CGRect frame = self.frame;
    frame.size.width = widths;
    frame.size.height = self.badgeHeight;
    self.frame = frame;
}



@end
