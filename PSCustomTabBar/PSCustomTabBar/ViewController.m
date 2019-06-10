//
//  ViewController.m
//  PSCustomTabBar
//
//  Created by Peng on 2019/6/7.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"
#import "PSTabBar/PSTabBadgeLabel.h"
#import "PSTabBarController.h"

@interface ViewController ()

@property (nonatomic, strong) PSTabBadgeLabel *badgeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnClick:(UIButton *)sender {
    PSTabBarController *controller = [[PSTabBarController alloc] init];
    switch (sender.tag) {
        case 0:
            controller.psTabBarType = PSTabBarTypeNone;
            break;
        case 1:
            controller.psTabBarType = PSTabBarTypeBackImage;
            break;
        case 2:
            controller.psTabBarType = PSTabBarTypeBackImageSelectColor;
            break;
        case 3:
            controller.psTabBarType = PSTabBarTypeBackImageTranslucent;
            break;
        case 4:
            controller.psTabBarType = PSTabBarTypeCircularProjection;
            break;
        case 5:
            controller.psTabBarType = PSTabBarTypeMultiCircularProjection;
            break;
        case 6:
            controller.psTabBarType = PSTabBarTypeSquareProjection;
            break;
        case 7:
            controller.psTabBarType = PSTabBarTypeHybridProjection;
            break;
        case 8:
            controller.psTabBarType = PSTabBarTypeCustomButtonSize;
            break;
        case 9:
            controller.psTabBarType = PSTabBarTypeCustomButtonAlignmentModle;
            break;
        case 10:
            controller.psTabBarType = PSTabBarTypeCustomButtonLayoutModle;
            break;
        case 11:
            controller.psTabBarType = PSTabBarTypeCustomButtonLogo;
            break;
        case 12:
            controller.psTabBarType = PSTabBarTypeCustomButtonInteractionAnimation;
            break;
        case 13:
            controller.psTabBarType = PSTabBarTypeCustomButtonDrawingPicture;
            break;
        case 14:
            controller.psTabBarType = PSTabBarTypeCustomButtonBackgroundColor;
            break;
        case 15:
            controller.psTabBarType = PSTabBarTypeCustomButtonBackgroundImage;
            break;
        case 16:
            controller.psTabBarType = PSTabBarTypeHybridGradient;
            break;
        case 17:
            controller.psTabBarType = PSTabBarTypeHybridButtonGradient;
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];
}



@end
