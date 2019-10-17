//
//  PSAffineTransformVC.m
//  AnimationObject
//
//  Created by Peng on 2019/6/28.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSAffineTransformVC.h"
#import "PSDefines.h"

@interface PSAffineTransformVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PSAffineTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //    transform = CGAffineTransformInvert(transform); // 相反的
    /**
     CGAffineTransformConcat 俩个合起来
     CGAffineTransformEqualToTransform 判断俩个是否相等
     CGRectApplyAffineTransform 对矩阵进行变换
     CGSizeApplyAffineTransform 返回由对现有高度和宽度的转换产生的高度和宽度。
     */
    // 初始化 原始状态
    __block CGAffineTransform transform = CGAffineTransformIdentity;
    weakify(self);
    dispatch_after_P(1, ^{
        switch (self.affineType) {
            case PSAffineTypeRotation: {
                [UIView animateWithDuration:2 animations:^{
                    // 默认往右转
                    transform = CGAffineTransformMakeRotation(M_PI);
                    weakself.imageView.transform = transform;
                }];
            }
                break;
            case PSAffineTypeScale: {
                [UIView animateWithDuration:2 animations:^{
                    // 放大
                    transform = CGAffineTransformMakeScale(1.5, 1.5);
                    weakself.imageView.transform = transform;
                }];
            }
                break;
            case PSAffineTypeTranslute: {
                [UIView animateWithDuration:2 animations:^{
                    // 放大
                    transform = CGAffineTransformMakeTranslation(20, 10);
                    weakself.imageView.transform = transform;
                }];
            }
                break;
            case PSAffineTypeHybrid: {
                [UIView animateWithDuration:2 animations:^{
                    transform = CGAffineTransformRotate(transform, M_PI);
                    transform = CGAffineTransformScale(transform, 1.2, 1.2);
                    transform = CGAffineTransformTranslate(transform, 40, 40);
                    weakself.imageView.transform = transform;
                }];
            }
                break;
            default:
                break;
        }
    });
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)click:(id)sender {
    __block CGAffineTransform transform = self.imageView.transform;
    weakify(self);
    switch (self.affineType) {
        case PSAffineTypeRotation: {
            //
            [UIView animateWithDuration:2 animations:^{
                // 在原始状态上执行更改
                // transform = CGAffineTransformMakeRotation(M_PI / 2);
                // 在当前状态上更改
                transform = CGAffineTransformRotate(transform, M_PI_2);
                
                weakself.imageView.transform = transform;
            }];
        }
            break;
        case PSAffineTypeScale: {
            [UIView animateWithDuration:2 animations:^{
                // 缩小
                transform = CGAffineTransformScale(transform, 0.8 , 0.9);
                weakself.imageView.transform = transform;
            }];
        }
            break;
        case PSAffineTypeTranslute: {
            [UIView animateWithDuration:2 animations:^{
                // 放大
                transform = CGAffineTransformTranslate(transform, 20, 20);
                weakself.imageView.transform = transform;
            }];
        }
            break;
        case PSAffineTypeHybrid: {
            [UIView animateWithDuration:2 animations:^{
                transform = CGAffineTransformRotate(transform, M_PI);
                transform = CGAffineTransformScale(transform, 1.2, 1.2);
                transform = CGAffineTransformTranslate(transform, 40, 40);
                weakself.imageView.transform = transform;
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
