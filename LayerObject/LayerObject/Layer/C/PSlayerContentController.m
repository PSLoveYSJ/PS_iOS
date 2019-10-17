//
//  PSlayerContentController.m
//  LayerObject
//
//  Created by Peng on 2019/7/9.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSlayerContentController.h"
#import "PSLayerContent.h"
#import "Header.h"

@interface PSlayerContentController ()<PSRouteHandler>

@end

@implementation PSlayerContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    PSLayerContent *layerContent = [[PSLayerContent alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    [self.view addSubview:layerContent];
    // Do any additional setup after loading the view.
}

+ (NSString *)routePath {
    return @"LayerContent";
}

+ (void)handleRequestWithParameters:(id)parameters topViewController:(UIViewController *)topViewController completionHandler:(void (^)(void))completionHandler passBackHandler:(void (^)(id _Nonnull))passBackHandler {
    PSlayerContentController *part = [PSlayerContentController new];
    [topViewController.navigationController pushViewController:part animated:YES];
}

@end
