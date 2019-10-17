//
//  ViewController.m
//  LayerObject
//
//  Created by Peng on 2019/5/17.
//  Copyright © 2019 PengShuai. All rights reserved.
//

#import "ViewController.h"
#import "Layer/Header.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *contentArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CALayer";
    [self.view addSubview:self.tableView];
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell)];
    cell.textLabel.text = self.contentArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = self.contentArray[indexPath.row];
    if ([text isEqualToString:@"粒子系统"]) {
        [PSRouter ps_handleRequest:@"Partcile"];
    } else if ([text isEqualToString:@"渐变色"]) {
        [PSRouter ps_handleRequest:@"Gradient"];
    } else if ([text isEqualToString:@"自定义Label"]) {
        [PSRouter ps_handleRequest:@"LayerLabel"];
    } else if ([text isEqualToString:@"ShapeLayer矢量图形"]) {
        [PSRouter ps_handleRequest:@"ShapeLayer"];
    } else if ([text isEqualToString:@"LayerContent"]) {
        [PSRouter ps_handleRequest:@"LayerContent"];
    }
}

- (NSMutableArray *)contentArray {
    if (!_contentArray) {
        _contentArray = [NSMutableArray arrayWithObjects:@"粒子系统"
                         ,@"渐变色"
                         ,@"自定义Label"
                         ,@"ShapeLayer矢量图形"
                         ,@"LayerContent", nil];
    }
    return _contentArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass(UITableViewCell)];
        
    }
    return _tableView;
}



@end
