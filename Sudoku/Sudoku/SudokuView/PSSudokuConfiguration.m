//
//  PSSudokuViewConfiguration.m
//  Sudoku
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSSudokuConfiguration.h"

@implementation PSSudokuConfiguration

- (instancetype)init {
    if (self == [super init]) {
        self.marginTop = 10;
        self.marginLeft = 20;
        self.marginRight = 20;
        self.marginBottom = 10;
        self.marginImageView = 10;
        self.playWay = PSPlayWaySequence;
    }
    return self;
}

@end
