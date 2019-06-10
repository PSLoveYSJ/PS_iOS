//
//  ViewController.m
//  PSFileAbout
//
//  Created by Peng on 2019/5/25.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger,PSDocumentPath) {
    PSDocumentPathTemp,
    PSDocumentPathDocument,
    PSDocumentPathCache,
    PSDocumentPathRoot,
};


@interface ViewController ()

@property (nonatomic, strong) NSFileManager *fileManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fileManager = [NSFileManager defaultManager];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)temp:(id)sender {
    NSLog(@"%@",[self getPathWith:PSDocumentPathTemp]);
}

- (IBAction)document:(id)sender {
    NSLog(@"%@",[self getPathWith:PSDocumentPathDocument]);
}
- (IBAction)cache:(id)sender {
    NSLog(@"%@",[self getPathWith:PSDocumentPathCache]);
}
- (IBAction)root:(id)sender {
    NSLog(@"%@",[self getPathWith:PSDocumentPathRoot]);
}
- (IBAction)createDirectory:(id)sender {
    NSString *filePath = [[self getPathWith:PSDocumentPathCache] stringByAppendingPathComponent:@"testCache"];
    if (![self.fileManager fileExistsAtPath:filePath]) {
        if ([self.fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"文件创建成功");
        } else {
            NSLog(@"文件创建失败");
        };
    }
}
- (IBAction)deleteDirectory:(id)sender {
    NSString *filePath = [[self getPathWith:PSDocumentPathCache] stringByAppendingPathComponent:@"testCache"];
    if ([self.fileManager fileExistsAtPath:filePath]) {
        if ([self.fileManager isDeletableFileAtPath:filePath]) {
            if ([self.fileManager removeItemAtPath:filePath error:nil]) {
                NSLog(@"文件夹删除成功");
            }
        }
    } else {
        NSLog(@"删除路径不存在");
    }
}




- (NSString *) getPathWith:(PSDocumentPath) path {
    NSString *pathString = nil;
    switch (path) {
        case PSDocumentPathDocument:
            pathString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
            break;
        case PSDocumentPathRoot:
            pathString = NSHomeDirectory();
            break;
        case PSDocumentPathTemp:
            pathString = NSTemporaryDirectory();
            break;
        case PSDocumentPathCache:
            pathString = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            break;
        default:
            break;
    }
    return pathString;
}


@end
