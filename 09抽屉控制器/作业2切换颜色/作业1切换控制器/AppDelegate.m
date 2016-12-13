//
//  AppDelegate.m
//  作业1切换控制器
//
//  Created by CORYIL on 16/5/3.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface AppDelegate ()



@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    /*————————————————————————————————————————————————————————————————————————————*/
    
    //1⃣️接受通知
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setCenter:) name:@"SetCenterVcNotification" object:nil];
    
    
    //1.
    _mmdc = [[MMDrawerController alloc]
             initWithCenterViewController:[[ViewController alloc] init] leftDrawerViewController:[[TableViewController alloc] init]];
    
    //2.
    _mmdc.maximumLeftDrawerWidth = 150;
    
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
    
    /*————————————————————————————————————————————————————————————————————————*/
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"colorName"]);
    
    //1.判断字典中是否保存了颜色
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"colorName"]) {
        
        //用字符串构建UIColor对象
        //1.通过字符串->方法名
        NSString *colorName = [[NSUserDefaults standardUserDefaults]objectForKey:@"colorName"];
        
        SEL selector = NSSelectorFromString(colorName);
        
        //2.使用UIColor类调用
        UIColor *color = [UIColor performSelector:selector];
        
        UIViewController *center = _mmdc.centerViewController;

        //3.改变center控制器所有子视图颜色
        for (UIView *subView in center.view.subviews) {
            
            subView.backgroundColor = color;
        }
        
    }
    
    return YES;
}

//通知调用方法
- (void)setCenter:(NSNotification *)notification{



}


@end
