//
//  PSSudokuViewConfiguration.h
//  Sudoku
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,PSPlayWay) {
    PSPlayWayRandom,
    PSPlayWaySequence, // 默认
};

@interface PSSudokuConfiguration : NSObject


/**
 距离左边多少 默认 20
 */
@property (nonatomic, assign) CGFloat marginLeft;

/**
 距离右边多少 默认 20
 */
@property (nonatomic, assign) CGFloat marginRight;
/**
 距离顶部多少 默认 10
 */
@property (nonatomic, assign) CGFloat marginTop;

/**
 距离底部多少 默认 10
 */
@property (nonatomic, assign) CGFloat marginBottom;

/**
 图片距离多少 默认 10
 */
@property (nonatomic, assign) CGFloat marginImageView;

/**
 播放模式
 */
@property (nonatomic, assign) PSPlayWay playWay;

/**
 图片数据
 */
@property (nonatomic, strong) NSMutableArray *dataArray;


@end

NS_ASSUME_NONNULL_END
