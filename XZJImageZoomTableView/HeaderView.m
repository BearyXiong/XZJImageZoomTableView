//
//  HeaderView.m
//  XZJImageZoomTableView
//
//  Created by BM on 2018/11/30.
//  Copyright © 2018 Beary Xiong. All rights reserved.
//

#import "HeaderView.h"
#import <Masonry.h>

@interface HeaderView ()

@property (nonatomic, strong) UIButton *leftButton;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _leftButton = [[UIButton alloc] init];
        [_leftButton setBackgroundColor:UIColor.clearColor];
        [_leftButton setTitle:@"设置" forState:UIControlStateNormal];
        [_leftButton.titleLabel setFont: [UIFont systemFontOfSize:15]];
        [_leftButton.layer setBorderWidth: 1];
        [_leftButton.layer setBorderColor: UIColor.whiteColor.CGColor];
        [_leftButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftButton];
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.top.equalTo(self.mas_top).with.offset(50);
        make.width.equalTo(@(60));
        make.height.equalTo(@(30));
    }];
    
    [super updateConstraints];
}

#pragma mark - Button Actions
- (void)buttonClick:(UIButton *)sender {
    NSLog(@"Button Action");
}

@end
