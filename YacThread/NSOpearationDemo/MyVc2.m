
//
//  MyVc2.m
//  YacThread
//
//  Created by ChangWingchit on 2017/4/22.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc2.h"

@interface MyVc2 ()

@end

@implementation MyVc2

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
  //2.封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1---%@",[NSThread currentThread]);
    }];
  //3.添加      NSOperation 会先调用start方法 再执行main方法，根据这个原理可以自己封装自己的东西
    [queue addOperation:op1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    //2.封装操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1---%@",[NSThread currentThread]);
        
        //更新UI操作
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            //TODO......
        }];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2---%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3---%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4---%@",[NSThread currentThread]);
    }];
    
    //操作监听
    op1.completionBlock = ^{
        NSLog(@"操作1完成");
    };
    
    //3.控制线程的执行顺序
    //注意点:不能循环依赖，不能跨队列依赖   NSOperationQueue *queue2 = [[NSOperationQueue alloc]init];
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    [op4 addDependency:op3];
    

    //4.添加至队列      NSOperation 会先调用start方法 再执行main方法，根据这个原理可以自己封装自己的东西
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperation:op4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
