//
//  PSLayerLabel.h
//  LayerObject
//
//  Created by Peng on 2019/5/17.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PSLayerLabel : UIView

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *) text NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
