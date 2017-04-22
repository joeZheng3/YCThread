
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
    // Do any additional setup after loading the view.
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
