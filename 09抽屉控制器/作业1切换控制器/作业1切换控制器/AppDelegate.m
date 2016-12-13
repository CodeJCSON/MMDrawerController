//
//  AppDelegate.m
//  作业1切换控制器
//
//  Created by CORYIL on 16/5/3.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "AppDelegate.h"
//#import "MMDrawerController.h"
#import "TableViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface AppDelegate ()



@end

@implementation AppDelegate

//懒加载:
- (NSMutableArray *)viewControllers{

    if (_viewControllers == nil) {
        
        _viewControllers = [NSMutableArray array];
    }
    return _viewControllers;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    /*————————————————————————————————————————————————————————————————————————————*/
    
    //1⃣️接受通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setCenter:) name:@"SetCenterVcNotification" object:nil];
    
    
    
    for (int i = 0; i<5; i++) {
        
        UIViewController *vc = [[UIViewController alloc]init];
        
        vc.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        
        [self.viewControllers addObject:vc];
    }
    
    //1.
    _mmdc = [[MMDrawerController alloc]initWithCenterViewController:self.viewControllers[0] leftDrawerViewController:[[TableViewController alloc] init]];
    
    //2.
    _mmdc.maximumLeftDrawerWidth = kScreenW/4;
    
    //阴影颜色
    _mmdc.shadowColor = [UIColor greenColor];
    //阴影偏移量
    _mmdc.shadowOffset = CGSizeMake(-5, 0);
    //手势模式
        //open手势
    _mmdc.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
        //close手势
    _mmdc.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    //3.
    self.window.rootViewController = _mmdc;
    
    
    //4.替换center控制器 附动画
//    [mmdc setCenterViewController:(UIViewController *)]
    
//    [mmdc setCenterViewController:(UIViewController *) withCloseAnimation:(BOOL) completion:^(BOOL finished) {}];
    
    
    
    return YES;
}

//通知调用方法
- (void)setCenter:(NSNotification *)notification{

    //根据点击的row获取对应的vc 设置到center
    NSIndexPath *indexPath = notification.userInfo[@"ip"];
    
    UIViewController *vc = self.viewControllers[indexPath.row];
    
    [_mmdc setCenterViewController:vc withCloseAnimation:YES completion:^(BOOL finished) {
        
    }];

}


@end
