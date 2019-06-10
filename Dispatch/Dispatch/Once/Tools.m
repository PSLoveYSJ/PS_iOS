//
//  Tools.m
//  Dispatch
//
//  Created by Peng on 2019/5/27.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "Tools.h"

@implementation Tools

static Tools *tools = nil;

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [Tools new];
    });
    return tools;
}

@end
