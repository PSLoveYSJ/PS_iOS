//
//  ViewController.m
//  AnimationObject
//
//  Created by Peng on 2019/5/21.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"
#import "PSAffineTransformVC.h"
#import "PS3DAffineTransformVC.h"
#import "PSCATransitionController.h"
#import "PSCAAnimationController.h"
#import "Animation/PSWavyController.h"
#import "PSDefines.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *contentArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.title = @"Animation";
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contentArray[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.contentArray count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor = [UIColor orangeColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    NSString *context = self.contentArray[indexPath.section][indexPath.row];
    cell.textLabel.text = context;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *contentString = self.contentArray[indexPath.section][indexPath.row];
    if (indexPath.section == 0) {
        PSAffineTransformVC *vc = [[PSAffineTransformVC alloc] initWithNibName:@"PSAffineTransformVC" bundle:nil];
        if (indexPath.row == 0) {
            vc.affineType = PSAffineTypeRotation;
        } else if (indexPath.row == 1) {
            vc.affineType = PSAffineTypeScale;
        } else if (indexPath.row == 2) {
            vc.affineType = PSAffineTypeTranslute;
        } else if (indexPath.row == 3) {
            vc.affineType = PSAffineTypeHybrid;
        }
        [self.navigationController pushViewController:vc animated:YES];
    } else if(indexPath.section == 1) {
        PS3DAffineTransformVC *vc = [[PS3DAffineTransformVC alloc] initWithNibName:@"PS3DAffineTransformVC" bundle:nil];
        if (indexPath.row == 0) {
            vc.affineType = PS3DAffineTypeRotation;
        } else if (indexPath.row == 1) {
            vc.affineType = PS3DAffineTypeScale;
        } else if (indexPath.row == 2) {
            vc.affineType = PS3DAffineTypeTranslute;
        } else if (indexPath.row == 3) {
            vc.affineType = PS3DAffineTypeHybrid;
        }
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 2) {
        PSCATransitionController *vc = [[PSCATransitionController alloc] initWithNibName:@"PSCATransitionController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 3) {
        PSCAAnimationController *vc = [[PSCAAnimationController alloc] initWithNibName:@"PSCAAnimationController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 4) {
        if ([contentString isEqualToString:@"波浪线"]) {
            PSWavyController *wavy = [PSWavyController new];
            [self.navigationController pushViewController:wavy animated:YES];
        }
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

- (NSMutableArray *)contentArray {
    if (!_contentArray) {
        _contentArray = [NSMutableArray arrayWithObjects:@[@"CGAffineTransform Rotation",@"CGAffineTransform Scale",@"CGAffineTransform Translute",@"CGAffineTransform Hybrid"]
                         ,@[@"CA3DAffineTransform Rotation",@"CA3DAffineTransform Scale",@"CA3DAffineTransform Translute",@"CA3DAffineTransform Hybrid"]
                         ,@[@"CATrasnition"]
                         ,@[@"CAAnimation"]
                         ,@[@"波浪线"]
                         , nil];
    }
    return _contentArray;
}


@end
