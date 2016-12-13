//
//  CRIDrawerController.m
//  01侧滑控制器
//
//  Created by CORYIL on 16/4/29.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "CRIDrawerController.h"

#define kDefaultLeftDrawerWidth 200
#define kDefaultRightDrawerWidth 200

@interface CRIDrawerController ()

/** 左侧控制器 */
@property (nonatomic,strong) UIViewController *leftViewController;

/** 中间控制器 */
@property (nonatomic,strong) UIViewController *centerViewController;

/** 右侧控制器 */
@property (nonatomic,strong) UIViewController *rightViewController;


@end

@implementation CRIDrawerController

//初始化方法

- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                          leftViewController:(UIViewController *)leftViewController{
    self = [super init];
    if (self) {
        //1.保存成员控制器
        self.centerViewController = centerViewController;
        self.leftViewController = leftViewController;
        
        //2.设置初始化左侧最大滑动距离
        _maximumLeftDrawerWidth = kDefaultLeftDrawerWidth;
    }
    return self;
}

- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                         rightViewController:(UIViewController *)rightViewController{

    self = [super init];
    if (self) {
        //1.保存成员控制器
        self.centerViewController = centerViewController;
        self.rightViewController = rightViewController;
        
        //2.设置初始化左侧最大滑动距离
        _maximumRightDrawerWidth = kDefaultRightDrawerWidth;
    }
    return self;

}

- (instancetype)initWithCenterViewController:(UIViewController *)centerViewController
                          leftViewController:(UIViewController *)leftViewController
                         rightViewController:(UIViewController *)rightViewController{
    self = [super init];
    if (self) {
        //1.保存成员控制器
        self.centerViewController = centerViewController;
        self.leftViewController = leftViewController;
        self.rightViewController = rightViewController;
        
        //2.设置初始化左侧最大滑动距离
        _maximumLeftDrawerWidth = kDefaultLeftDrawerWidth;
        _maximumRightDrawerWidth = kDefaultRightDrawerWidth;
    }
    return self;
}


//视图加载完毕

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view insertSubview:self.leftViewController.view atIndex:0];
    
    [self.view insertSubview:self.rightViewController.view atIndex:0];

    //获取中间控制器的视图 并添加到父视图上
    [self.view addSubview:self.centerViewController.view];
}

//侧滑方法

- (void)showLeftViewControllerWithAnimated:(BOOL)animated{
    
    [self.view insertSubview:self.leftViewController.view belowSubview:self.centerViewController.view];

    if (animated == YES) {
        //向右侧滑 附动画
        [UIView animateWithDuration:0.25 animations:^{
            
            self.centerViewController.view.transform = CGAffineTransformMakeTranslation(_maximumLeftDrawerWidth, 0);
        }];
        
    }else{
        //向右侧滑 无动画
        self.centerViewController.view.transform = CGAffineTransformMakeTranslation(_maximumLeftDrawerWidth, 0);
    }

}

- (void)showRightViewControllerWithAnimated:(BOOL)animated{
    
    [self.view insertSubview:self.rightViewController.view belowSubview:self.centerViewController.view];
    
    if (animated == YES) {
        //向右侧滑 附动画
        [UIView animateWithDuration:0.25 animations:^{
            
            self.centerViewController.view.transform = CGAffineTransformMakeTranslation(-_maximumRightDrawerWidth, 0);
        }];
        
    }else{
        //向右侧滑 无动画
        self.centerViewController.view.transform = CGAffineTransformMakeTranslation(-_maximumRightDrawerWidth, 0);
    }
    
}

- (void)showCenterViewControllerWithAnimated:(BOOL)animated{

    if (animated == YES) {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.centerViewController.view.transform = CGAffineTransformIdentity;
        }];
        
    }else{
    
        self.centerViewController.view.transform = CGAffineTransformIdentity;
    }

}


//宽度自适应

- (void)leftViewWidthToFit{
    
    CGRect frame = self.leftViewController.view.frame;
    
    frame.size.width = _maximumLeftDrawerWidth;
    
    self.leftViewController.view.frame = frame;
}

- (void)rightViewWidthToFit{
    
    CGRect frame = self.rightViewController.view.frame;
    
    frame.size.width = _maximumRightDrawerWidth;
    frame.origin.x = self.view.bounds.size.width - _maximumRightDrawerWidth;
    
    self.rightViewController.view.frame = frame;
}

@end
