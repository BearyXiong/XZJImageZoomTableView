//
//  XZJImageZoomTableView.m
//  XZJImageZoomTableView
//
//  Created by BM on 2018/11/29.
//  Copyright © 2018 Beary Xiong. All rights reserved.
//

#import "XZJImageZoomTableView.h"

@interface XZJImageZoomTableView ()

@property (nonatomic, strong) UIView *customBackgorundView;

@property (nonatomic, strong) UIImageView *zoomImageView;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) CGSize defaultHeaderSize;

@end

@implementation XZJImageZoomTableView
#pragma mark - Getters and setters
- (UIView *)customBackgorundView {
    if(!_customBackgorundView) {
        _customBackgorundView = [[UIView alloc] init];
        _customBackgorundView.backgroundColor = UIColor.clearColor;
    }
    return _customBackgorundView;
}

- (UIImageView *)zoomImageView {
    if(!_zoomImageView) {
        _zoomImageView = [[UIImageView alloc] init];
        _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _zoomImageView;
}

- (UIView *)headerView {
    if(!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = UIColor.clearColor;
    }
    return _headerView;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.zoomImageView.image = _image;
}

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image headerHeight:(CGFloat)height {
    self = [super initWithFrame:frame];
    if(self) {
        // 初始化基本参数
        _headerHeight = height;
        self.image = image;
        self.defaultHeaderSize = CGSizeMake(frame.size.width, _headerHeight);
        self.backgroundColor = UIColor.whiteColor;
        // 界面布局
        [self interfaceLayout];
        // KVO：监听 TableView 的滚动
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)interfaceLayout {
    // Layout
    // Backgound View
    self.zoomImageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.headerHeight);
    self.customBackgorundView.frame = self.bounds;
    [self.customBackgorundView addSubview:self.zoomImageView];
   
    // Header View
    self.headerView.frame = CGRectMake(0, 0, self.bounds.size.width, self.headerHeight);
    
    // Table View
    self.backgroundView = self.customBackgorundView;
    self.tableHeaderView = self.headerView;
    
    // 解决 iOS 11 TableView 的内容边距空白的问题
    if ([self respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString:@"contentOffset"]) {
        CGFloat moveY = self.contentOffset.y;
        CGRect frame = self.zoomImageView.frame;
        if(self.contentOffset.y < 0) {
            frame.size.height = self.defaultHeaderSize.height - moveY;
            frame.size.width = self.defaultHeaderSize.width - moveY;
            self.zoomImageView.center = CGPointMake(self.defaultHeaderSize.width / 2, self.defaultHeaderSize.height / 2);
        } else {
            frame.origin.y = -self.contentOffset.y;
        }
        if(!CGRectEqualToRect(self.zoomImageView.frame, frame)) {
            self.zoomImageView.frame = frame;
        }
    }
}

#pragma mark - Public Methods
- (void)addHeaderView:(UIView *)view {
    [self.headerView addSubview:view];
}

@end
