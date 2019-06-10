//
//  PSSudokuView.h
//  Sudoku
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PSSudokuConfiguration;
typedef void(^ImageClick)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface PSSudokuView : UIView

@property (nonatomic, assign, readonly) CGFloat ps_maxHeight;
@property (nonatomic, copy) ImageClick imageClick;

+ (instancetype) ps_sudokuViewWith:(PSSudokuConfiguration *) config;

- (void) ps_startAllGifAnimation;
- (void) ps_stopAllGifAnimation;

- (void) ps_startGifAnimationAtIndex:(NSInteger) index;
- (void) ps_stopGifAnimationAtIndex:(NSInteger) index all:(BOOL) isAll;

@end

NS_ASSUME_NONNULL_END
