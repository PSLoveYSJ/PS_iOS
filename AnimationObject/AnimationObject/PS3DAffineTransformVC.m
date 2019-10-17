//
//  PS3DAffineTransformVC.m
//  AnimationObject
//
//  Created by Peng on 2019/6/28.
//  Copyright © 2019 PengShuai. All rights reserved.
//


/**
 CATransform3DInvert 相反的
 CATransform3DIsAffine 是否可以用Affine表示
 CATransform3DIsIdentity 恒等
 CATransform3DEqualToTransform 俩个3d是否相等
 CATransform3DMakeAffineTransform AffineTransform 转换为3DTransform
 CATransform3DGetAffineTransform 3DTransform 转换为 AffineTransform
 */

#import "PS3DAffineTransformVC.h"
#import "PSDefines.h"

@interface PS3DAffineTransformVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PS3DAffineTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    __block CATransform3D transform = CATransform3DIdentity;
    weakify(self);
    dispatch_after_P(1, ^{
        switch (self.affineType) {
            case PS3DAffineTypeRotation: {
                //
                [UIView animateWithDuration:2 animations:^{
                    // 在原始状态上执行更改
                    transform = CATransform3DMakeRotation(M_PI_2, 1.2, 1.0, 1.0);
                    weakself.imageView.layer.transform = transform;
                }];
            }
                break;
            case PS3DAffineTypeScale: {
                [UIView animateWithDuration:2 animations:^{
                    // 缩小
                    transform = CATransform3DMakeScale(1.5, 1.3, 1.5);
                    weakself.imageView.layer.transform = transform;
                }];
            }
                break;
            case PS3DAffineTypeTranslute: {
                [UIView animateWithDuration:2 animations:^{
                    transform = CATransform3DMakeTranslation(10, 10, 10);
                    weakself.imageView.layer.transform = transform;
                }];
            }
                break;
            case PS3DAffineTypeHybrid: {
                [UIView animateWithDuration:2 animations:^{
                    transform = CATransform3DMakeRotation(M_PI_2, 1.2, 1.0, 1.0);
                    transform = CATransform3DScale(transform, 1.2, 1.2, 1.2);
                    transform = CATransform3DTranslate(transform, 10, 10, 10);
                    weakself.imageView.layer.transform = transform;
                }];
            }
                break;
                
            default:
                break;
        }
    });
}

- (IBAction)click:(id)sender {
    __block CATransform3D transform = self.imageView.layer.transform;
    weakify(self);
    switch (self.affineType) {
        case PS3DAffineTypeRotation: {
            //
            [UIView animateWithDuration:2 animations:^{
                // 在原始状态上执行更改
                // transform = CGAffineTransformMakeRotation(M_PI / 2);
                // 在当前状态上更改
                transform = CATransform3DRotate(transform, M_PI_2, 1.0, 1.0, 1.0);
                weakself.imageView.layer.transform = transform;
            }];
        }
            break;
        case PS3DAffineTypeScale: {
            [UIView animateWithDuration:2 animations:^{
                // 缩小
                transform = CATransform3DMakeScale(1.2, 1.2, 1.2);
                weakself.imageView.layer.transform = transform;
            }];
        }
            break;
        case PS3DAffineTypeTranslute: {
            [UIView animateWithDuration:2 animations:^{
                // 放大
                transform = CATransform3DMakeTranslation(10, 10, 10);
                weakself.imageView.layer.transform = transform;
            }];
        }
            break;
        case PS3DAffineTypeHybrid: {
            [UIView animateWithDuration:2 animations:^{
                transform = CATransform3DMakeRotation(M_PI_2, 1.2, 1.0, 1.0);
                transform = CATransform3DScale(transform, 1.2, 1.2, 1.2);
                transform = CATransform3DTranslate(transform, 10, 10, 10);
                weakself.imageView.layer.transform = transform;
            }];
        }
            break;
            
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
