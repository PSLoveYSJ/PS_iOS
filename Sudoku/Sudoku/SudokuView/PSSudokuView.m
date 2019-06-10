//
//  PSSudokuView.m
//  Sudoku
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSSudokuView.h"
#import "FLAnimatedImageView+WebCache.h"
#import "NSData+ImageContentType.h"
#import "PSSudokuConfiguration.h"

#define labTag   666

#define kPSSCREENW   UIScreen.mainScreen.bounds.size.width
#define kPSSCREENH  UIScreen.mainScreen.bounds.size.height

@interface PSSudokuView()

@property(nonatomic,strong) NSMutableDictionary <NSNumber*,FLAnimatedImageView*>* gifDic;

@property (nonatomic, strong) PSSudokuConfiguration *configuration;

@property (nonatomic, assign) CGFloat ps_maxHeight;

@property(nonatomic, assign) BOOL isAnimateing;

@property(nonatomic, assign) BOOL isCompleted;

@property(nonatomic,strong)NSArray <NSNumber *>* sortKeys;

@end


@implementation PSSudokuView

+ (instancetype)ps_sudokuViewWith:(PSSudokuConfiguration *)config{
    PSSudokuView *sudoku = [PSSudokuView new];
    sudoku.configuration = config;
    [sudoku setUpUI];
    return sudoku;
}

- (void) setUpUI {
    if (self.configuration.dataArray.count <= 0) {
        return;
    }
    CGFloat imageW = [self caculateHeight];
    dispatch_group_t group = dispatch_group_create();
    for (int i = 0; i < self.configuration.dataArray.count; i++) {
        NSInteger column = i % 3;
        NSInteger row = i/3;
        FLAnimatedImageView *imageView = [self creatImageViewWithFrame:CGRectMake(self.configuration.marginLeft + column *(imageW + self.configuration.marginImageView), self.configuration.marginTop + row * (self.configuration.marginTop + imageW), imageW, imageW)
                                                              imageTag:i];
        id imageData = [self.configuration.dataArray objectAtIndex:i];
        if ([imageData isKindOfClass:[NSData class]]) {
            // 本地
            SDImageFormat imageFormat = [NSData sd_imageFormatForImageData:imageData];
            if (imageFormat == SDImageFormatGIF) {
                imageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imageData];
                imageView.image = nil;
                self.gifDic[@(imageView.tag)] = imageView;
                [imageView viewWithTag:labTag].hidden = false;
                [imageView stopAnimating];
            } else {
                [imageView viewWithTag:labTag].hidden = true;
                imageView.animatedImage = nil;
                imageView.image = [UIImage imageWithData:imageData];
            }
            [self sortGiftDic];
            [self playGiftWithIndex:0];
        } else if ([imageData isKindOfClass:[NSString class]]) {
            // 网络
            dispatch_group_enter(group);
            NSURL *url = [NSURL URLWithString:imageData];
            [imageView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                dispatch_group_leave(group);
                if (error) {
                    return;
                }
                [self imageLoadFinish:url imageView:imageView];
            }];
            dispatch_group_notify(group, dispatch_get_main_queue(), ^{
                [self sortGiftDic];
                [self playGiftWithIndex:0];
            });
        }
    }
}

-(void)imageLoadFinish:(NSURL *)url imageView:(FLAnimatedImageView *)imageView {
    NSData * imageData = [self getCacheImageDataForModel:url];
    SDImageFormat imageFormat = [NSData sd_imageFormatForImageData:imageData];
    if (imageFormat == SDImageFormatGIF) {
        self.gifDic[@(imageView.tag)] = imageView;
        [imageView viewWithTag:labTag].hidden = false;
        [imageView stopAnimating];
    } else {
        [imageView viewWithTag:labTag].hidden = true;
    }
}

- (NSData *)getCacheImageDataForModel:(NSURL *)url {
    
    SDImageCache * imageCache = [SDImageCache sharedImageCache];
    NSString*cacheImageKey = [[SDWebImageManager sharedManager]cacheKeyForURL:url];
    NSString *defaultPath = [imageCache defaultCachePathForKey:cacheImageKey];
    NSData *data = [NSData dataWithContentsOfFile:defaultPath];
    if (data) {
        return data;
    }else{
        return  nil;
    }
}

- (CGFloat) caculateHeight {
    CGFloat imageW = (kPSSCREENW - self.configuration.marginRight - self.configuration.marginLeft - self.configuration.marginImageView * 2) / 3;
    NSInteger row = self.configuration.dataArray.count / 3;
    NSInteger column = self.configuration.dataArray.count % 3;
    NSInteger list = (row + (column == 0 ? 0 : 1));
    self.ps_maxHeight = list * imageW + self.configuration.marginTop * list + self.configuration.marginBottom;
    return imageW;
}

#pragma mark &************ 设置图片

- (FLAnimatedImageView *)creatImageViewWithFrame:(CGRect)frame imageTag:(NSInteger)imageTag {
    FLAnimatedImageView * imageView = [[FLAnimatedImageView alloc]initWithFrame:frame];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.backgroundColor = [UIColor grayColor];
    imageView.clipsToBounds = YES;
    imageView.tag = imageTag;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewClick:)];
    [imageView addSubview:[self addGifLab]];
    [imageView addGestureRecognizer:tap];
    [self addSubview:imageView];
    return imageView;
}

//gif flag
- (UILabel *)addGifLab{
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @" 动图 ";
    lab.textColor = [UIColor grayColor];
    lab.font = [UIFont systemFontOfSize:14];
    lab.backgroundColor = [UIColor colorWithRed:240/255.0 green:156/255.0 blue:56/255.0 alpha:1];
    [lab sizeToFit];
    lab.font = [UIFont systemFontOfSize:13];
    CGRect oldFrame = lab.frame; oldFrame.origin = CGPointMake(5, 5);
    lab.frame = oldFrame;
    lab.hidden = true;
    lab.layer.cornerRadius = lab.frame.size.height*0.5;
    lab.layer.masksToBounds = true;
    lab.tag = labTag;
    return lab;
}

- (void) sortGiftDic {
    if (self.gifDic.count==0) { return ; }
    if (self.configuration.playWay == PSPlayWaySequence) {
        _sortKeys = [self.gifDic.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
    }else{
        _sortKeys = self.gifDic.allKeys;
    }
}

- (void) playGiftWithIndex:(NSInteger) index {
    if (self.gifDic.count==0) { return; }
    self.isCompleted = true;
    self.isAnimateing = true;
    NSNumber * key = _sortKeys[index];
    FLAnimatedImageView * imageV = self.gifDic[key];
    
    __weak typeof(FLAnimatedImageView *)weakImagev = imageV;
    __weak typeof(NSArray<NSNumber*> *)weakSortKeys = _sortKeys;
    [imageV startAnimating];
    imageV.loopCompletionBlock = ^(NSUInteger loopCountRemaining) {
        [weakImagev stopAnimating ];
        NSInteger nextindex = index+1== weakSortKeys.count? 0: index+1;
        [self playGiftWithIndex: nextindex];
    };
}

- (void)ps_startAllGifAnimation {
    if (!self.isCompleted || self.isAnimateing) {
        return;
    }
    [self playGiftWithIndex:0];
}

- (void)ps_startGifAnimationAtIndex:(NSInteger)index {
    [self playGiftWithIndex:index];
}

- (void)ps_stopAllGifAnimation {
    if(!self.isAnimateing)return;
    
    if (!NSThread.isMainThread) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.gifDic enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, FLAnimatedImageView * _Nonnull obj, BOOL * _Nonnull stop) {
                [obj stopAnimating];
            }];
            self.isAnimateing = false;
        });
    }else{
        [self.gifDic enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, FLAnimatedImageView * _Nonnull obj, BOOL * _Nonnull stop) {
            [obj stopAnimating];
        }];
        self.isAnimateing = false;
    }
}

- (void)ps_stopGifAnimationAtIndex:(NSInteger)index all:(BOOL)isAll {
    [self ps_stopAllGifAnimation];
    if (!isAll) {
        [self playGiftWithIndex:index + 1];
    }
}

- (void)imageViewClick:(UITapGestureRecognizer *)tap {
    if (self.imageClick) {
        self.imageClick(tap.view.tag);
    }
}

- (NSMutableDictionary<NSNumber *,FLAnimatedImageView *> *)gifDic {
    if (!_gifDic) {
        _gifDic = [NSMutableDictionary dictionary];
    }
    return _gifDic;
}

@end
