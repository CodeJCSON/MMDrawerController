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

/** 数据 */
@property (nonatomic,strong) NSArray *data;


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"color" ofType:@"plist"]];
    
    
    //1.注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"left"];
    
   
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //2.复用or创建
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"left" forIndexPath:indexPath];
    

    cell.textLabel.text = _data[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取中央控制器
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    UIViewController *center = app.mmdc.centerViewController;
    
    //用字符串构建UIColor对象
        //1.通过字符串->方法名
    NSString *colorName = [NSString stringWithFormat:@"%@Color",_data[indexPath.row]];
    
    SEL selector = NSSelectorFromString(colorName);
    
        //2.使用UIColor类调用
    UIColor *color = [UIColor performSelector:selector];
//    [UIColor blackColor]
    
        //3.改变颜色
    
    for (UIView *subView in center.view.subviews) {
        
        subView.backgroundColor = color;
    }
    
    //4.存储颜色至本地化字典
    [[NSUserDefaults standardUserDefaults]setObject:colorName forKey:@"colorName"];
    
    
    
    //方法选择器:
//    [调用者 performSelector:SEL类型的方法名];
//    [self performSelector:<#(SEL)#> withObject:<#(id)#>]
//    [self performSelector:<#(SEL)#> withObject:<#(id)#> withObject:<#(id)#>]
    
    
    
    //如下俩个调用方法等价
//    [self method:@"打印"];
    
//    [self haha];
    
    //判断某个类是否响应某个方法
    if ([self respondsToSelector:@selector(haha:)]) {
        
        [self performSelector:@selector(haha:) withObject:@"打印"];

    }
    

}

- (void)method:(NSString *)string{

    NSLog(@"%@",string);
}




@end
