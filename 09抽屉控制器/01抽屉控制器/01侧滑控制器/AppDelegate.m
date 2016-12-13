//
//  AppDelegate.m
//  01侧滑控制器
//
//  Created by CORYIL on 16/4/29.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "AppDelegate.h"
#import "CRIDrawerController.h"

@interface AppDelegate ()
{
    CRIDrawerController *criDC;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor lightGrayColor];
    
    [self.window makeKeyAndVisible];
    
    /*————————————————————————————————————————————————————————————————————————————*/
    
    UIViewController *left = [[UIViewController alloc]init];
    left.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *right = [[UIViewController alloc]init];
    right.view.backgroundColor = [UIColor redColor];
    
    UIViewController *center = [[UIViewController alloc]init];
    center.view.backgroundColor = [UIColor cyanColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(0, 50, 50, 50);
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [center.view addSubview:button];
    
    criDC = [[CRIDrawerController alloc]initWithCenterViewController:center leftViewController:left rightViewController:right];
    
    criDC.maximumLeftDrawerWidth = 100;
    
    criDC.maximumRightDrawerWidth = 200;
    
    [criDC leftViewWidthToFit];
    
    [criDC rightViewWidthToFit];
    
    self.window.rootViewController = criDC;
    
    
    return YES;
}

- (void)click:(UIButton *)button{
    
    button.selected = !button.selected;
    
    if (button.selected == YES) {
        [criDC showRightViewControllerWithAnimated:YES];

    }else{
        [criDC showCenterViewControllerWithAnimated:YES];
    }


}

@end
