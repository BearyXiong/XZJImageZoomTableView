//
//  ViewController.m
//  XZJImageZoomTableView
//
//  Created by BM on 2018/11/29.
//  Copyright © 2018 Beary Xiong. All rights reserved.
//

#import "ViewController.h"
#import "XZJImageZoomTableView.h"
#import <Masonry/Masonry.h>
#import "HeaderView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) XZJImageZoomTableView *tableView;

@end

@implementation ViewController

- (XZJImageZoomTableView *)tableView {
    if(!_tableView) {
        CGSize screenSize = UIScreen.mainScreen.bounds.size;
        _tableView = [[XZJImageZoomTableView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height) image:[UIImage imageNamed:@"bg_header"] headerHeight:200];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    
    // Header View
    HeaderView *view = [[HeaderView alloc] init];
    [self.tableView addHeaderView:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.superview.mas_top);
        make.left.equalTo(view.superview.mas_left);
        make.right.equalTo(view.superview.mas_right);
        make.height.equalTo(@(200));
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.textColor = UIColor.blackColor;
    cell.textLabel.text = @"测试";
    return cell;
}

@end
