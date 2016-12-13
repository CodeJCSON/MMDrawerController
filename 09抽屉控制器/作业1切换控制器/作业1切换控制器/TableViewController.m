//
//  TableViewController.m
//  作业1切换控制器
//
//  Created by CORYIL on 16/5/3.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"left"];
    
   
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //2.复用or创建
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"left" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"v110_02Index_icon%02ld",indexPath.row+1]];
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //1.通知
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"SetCenterVcNotification" object:nil userInfo:@{@"ip":indexPath}];
    
    //2.appdelegate:是应用程序的代理对象 是一个单例对象 我们程序中任何一个位置都可以获取调用appdelegate的相关属性和方法
    
        //获取AppDelegate对象
    AppDelegate *appDelegate =  [UIApplication sharedApplication].delegate;
        //获取AppDelegate的mmdc属性
    UIViewController *vc = appDelegate.viewControllers[indexPath.row];
    
    [appDelegate.mmdc setCenterViewController:vc withCloseAnimation:YES completion:nil];
}



@end
