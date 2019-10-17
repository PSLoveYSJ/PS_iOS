//
//  PSLayerLabelController.m
//  LayerObject
//
//  Created by Peng on 2019/7/9.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "PSLayerLabelController.h"
#import "PSLayerLabel.h"
#import "Header.h"

@interface PSLayerLabelController ()<PSRouteHandler>

@end

@implementation PSLayerLabelController

- (void)viewDidLoad {
    [super viewDidLoad];
    PSLayerLabel *label = [[PSLayerLabel alloc] initWithFrame:CGRectMake(0, 0, 200, 300) text:@"hahahahahahahaha"];
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
}

+ (NSString *)routePath {
    return @"LayerLabel";
}

+ (void)handleRequestWithParameters:(id)parameters topViewController:(UIViewController *)topViewController completionHandler:(void (^)(void))completionHandler passBackHandler:(void (^)(id _Nonnull))passBackHandler {
    PSLayerLabelController *part = [PSLayerLabelController new];
    [topViewController.navigationController pushViewController:part animated:YES];
}

@end
