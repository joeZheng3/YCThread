//
//  MyVc4.m
//  YacThread
//
//  Created by ChangWingchit on 2017/4/23.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc4.h"

@interface MyVc4 ()

@end

@implementation MyVc4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取主线程
    NSThread *mainThread = [NSThread mainThread];
    NSLog(@"%@",mainThread);
    
    //获取当前线程
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"%@",currentThread);
    
    //判断是否为主线程 1.打印结果number == 1 2.BOOL isMainThread = [NSThread isMainThread];

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
