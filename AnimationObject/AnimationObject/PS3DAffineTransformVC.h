//
//  PS3DAffineTransformVC.h
//  AnimationObject
//
//  Created by Peng on 2019/6/28.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PS3DAffineType) {
    PS3DAffineTypeRotation,
    PS3DAffineTypeScale,
    PS3DAffineTypeTranslute,
    PS3DAffineTypeHybrid,
};

@interface PS3DAffineTransformVC : UIViewController

@property (nonatomic, assign) PS3DAffineType affineType;

@end

NS_ASSUME_NONNULL_END
