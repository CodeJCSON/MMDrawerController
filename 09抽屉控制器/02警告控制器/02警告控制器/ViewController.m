//
//  ViewController.m
//  02警告控制器
//
//  Created by CORYIL on 16/4/29.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)normal:(id)sender {
    
    /**
     *  
     typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
     UIAlertControllerStyleActionSheet = 0,  屏幕底部的操作列表
     UIAlertControllerStyleAlert             屏幕中央的警告框
     }

     */
    //1.创建
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"提示信息" preferredStyle:UIAlertControllerStyleAlert];
    
    //2.添加按钮
    /**
     *  
     typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
     UIAlertActionStyleDefault = 0,    默认
     UIAlertActionStyleCancel,         取消
     UIAlertActionStyleDestructive     破坏的；毁灭性的；有害的，消极的
     } ;
     */
    
    /**
     *  UIAlertActionStyleDefault:
     特点:蓝字
     布局:按添加顺序
     */
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确认1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        NSLog(@"Default");
    }];
    
    /**
     *  UIAlertActionStyleCancel:
        特点:‼️至多只能添加一个 (多个会报错)
        布局:两个按钮居左 多个按钮居下
     */
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"cancel");
    }];
    /**
     *  UIAlertActionStyleDestructive:
     特点:红字
     布局:按添加顺序
     */
    UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"确认2" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"destructive");
    }];
    
        //添加
    [alert addAction:cancel];
    
    [alert addAction:defaultAction];

    [alert addAction:destructive];

   
    
    
    //end.模态弹出
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)textfield:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"附输入框" preferredStyle:UIAlertControllerStyleAlert];
    
    //添加输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        //设置相关属性的地方
        textField.tintColor = [UIColor cyanColor];
        
        textField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入你的支付宝账号 嘻嘻" attributes:@{NSForegroundColorAttributeName:[UIColor cyanColor],NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.tintColor = [UIColor redColor];
        
        textField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入你的支付宝密码 嘻嘻" attributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        
        textField.secureTextEntry = YES;
    }];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //从alert的数组中获取一个textfield
        NSLog(@"%@",[alert.textFields firstObject].text);
        NSLog(@"%@",[alert.textFields lastObject].text);

        
    }];
    [alert addAction:confirm];

    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)actionsheet:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"操作列表" message:@"提示消息" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //2.添加按钮
    /**
     *
     typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
     UIAlertActionStyleDefault = 0,    默认
     UIAlertActionStyleCancel,         取消
     UIAlertActionStyleDestructive     破坏的；毁灭性的；有害的，消极的
     } ;
     */
    
    /**
     *  UIAlertActionStyleDefault:
     特点:蓝字
     布局:按添加顺序
     */
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确认1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"Default");
    }];
    
    /**
     *  UIAlertActionStyleCancel:
     特点:‼️至多只能添加一个 (多个会报错)
     布局:两个按钮居左 多个按钮居下
     */
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"cancel");
    }];
    /**
     *  UIAlertActionStyleDestructive:
     特点:红字
     布局:按添加顺序
     */
    UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"确认2" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"destructive");
    }];
    
    //添加
    [alert addAction:cancel];
    
    [alert addAction:defaultAction];
    
    [alert addAction:destructive];
    
    
    
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
