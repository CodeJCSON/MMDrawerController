//
//  CRIDrawerController.h
//  01侧滑控制器
//
//  Created by CORYIL on 16/4/29.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRIDrawerController : UIViewController


/** 左侧滑宽度 */
@property(nonatomic,assign) CGFloat maximumLeftDrawerWidth;
/** 右侧滑宽度 */
@property(nonatomic,assign) CGFloat maximumRightDrawerWidth;

/** 初始化:使用  中间+左侧+右侧 视图控制器 */
- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                          leftViewController:(UIViewController *)leftViewController
                         rightViewController:(UIViewController *)rightViewController;

/** 初始化:使用  中间+左侧 视图控制器 */
- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                          leftViewController:(UIViewController *)leftViewController;
/** 初始化:使用  中间+右侧 视图控制器 */
- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                         rightViewController:(UIViewController *)rightViewController;

/** 显示左侧控制器的方法 */
- (void)showLeftViewControllerWithAnimated:(BOOL)animated;
/** 显示中央控制器的方法 */
- (void)showCenterViewControllerWithAnimated:(BOOL)animated;
/** 显示右侧控制器的方法 */
- (void)showRightViewControllerWithAnimated:(BOOL)animated;

/** 左侧视图宽度自适应 */
- (void)leftViewWidthToFit;
/** 右侧视图宽度自适应 */
- (void)rightViewWidthToFit;

@end
