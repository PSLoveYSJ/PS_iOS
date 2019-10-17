//
//  PSAffineTransformVC.h
//  AnimationObject
//
//  Created by Peng on 2019/6/28.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PSAffineType) {
    PSAffineTypeRotation,
    PSAffineTypeScale,
    PSAffineTypeTranslute,
    PSAffineTypeHybrid,
};

@interface PSAffineTransformVC : UIViewController

@property (nonatomic, assign) PSAffineType affineType;

@end

NS_ASSUME_NONNULL_END
