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
#pragma mark - 系统方法
  //1.创建线程
    NSThread *thread = [[NSThread alloc]initWithTarget:self
                                              selector:@selector(test)
                                                object:nil];
  //2.启动线程
    [thread start];
    
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
