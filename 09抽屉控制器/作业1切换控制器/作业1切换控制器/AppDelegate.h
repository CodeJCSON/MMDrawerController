//
//  AppDelegate.h
//  作业1切换控制器
//
//  Created by CORYIL on 16/5/3.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** 控制器数组 */
@property (nonatomic,strong) NSMutableArray *viewControllers;

/** MMDrawer */
@property (nonatomic,strong) MMDrawerController *mmdc;


@end

