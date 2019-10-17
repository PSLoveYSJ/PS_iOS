//
//  PSShapeController.m
//  LayerObject
//
//  Created by Peng on 2019/7/9.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSShapeController.h"
#import "Header.h"
#import "PSShapeLayer.h"

@interface PSShapeController ()<PSRouteHandler>

@end

@implementation PSShapeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

+ (NSString *)routePath {
    return @"ShapeLayer";
}

+ (void)handleRequestWithParameters:(id)parameters topViewController:(UIViewController *)topViewController completionHandler:(void (^)(void))completionHandler passBackHandler:(void (^)(id _Nonnull))passBackHandler {
    PSShapeController *part = [PSShapeController new];
    [topViewController.navigationController pushViewController:part animated:YES];
}

@end
