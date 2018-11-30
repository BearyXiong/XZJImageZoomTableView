//
//  XZJImageZoomTableView.h
//  XZJImageZoomTableView
//
//  Created by BM on 2018/11/29.
//  Copyright © 2018 Beary Xiong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XZJImageZoomTableView : UITableView

@property (nonatomic, strong) UIImage *image;

/**
 初始化对象

 @param frame frame
 @param image 需要缩放的图片
 @param height Heather 的高度
 @return XZJImageZoomTableView Objct
 */
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image headerHeight:(CGFloat)height;



/**
 添加子视图到 Header 中

 @param view 子视图
 */
- (void)addHeaderView:(UIView *)view;
    
@end

NS_ASSUME_NONNULL_END
