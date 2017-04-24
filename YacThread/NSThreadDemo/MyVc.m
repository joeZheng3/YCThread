//
//  MyVc.m
//  YacThread
//
//  Created by ChangWingchit on 2017/4/22.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc.h"
#import "YacThread.h"

@interface MyVc ()

@end

@implementation MyVc

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
#pragma mark - 属性
    NSThread *thread0 = [NSThread new];
    thread0.name = @""; //线程名字
    thread0.threadPriority = 1.0; //线程优先级 0.0～0.5～1.0
    
#pragma mark - 系统方法
  //1.创建线程
    NSThread *thread = [[NSThread alloc]initWithTarget:self
                                              selector:@selector(test)
                                                object:nil];
  //2.启动线程
    [thread start];
    
  //3.类方法启动线程
    [NSThread detachNewThreadSelector:@selector(test) toTarget:self withObject:nil];
    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"这是一个线程");
    }];
    
#pragma mark - 封装的线程
    //看到封装的线程,要去封装的线程里看重写的main方法，用系统的的则initTarget告诉线程需要执行什么方法
    //1.创建线程
    YacThread *thread2 = [[YacThread alloc]init];
    //2.启动线程
    [thread2 start];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test
{
    //线程阻塞
//    [NSThread sleepForTimeInterval:2.0];
//    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.0]];
    
    //线程退出
//    [NSThread exit];
    
    NSLog(@"这是一个nsthread线程");
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
