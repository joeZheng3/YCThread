//
//  MyVc5.m
//  YacThread
//
//  Created by ChangWingchit on 2017/4/23.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc5.h"
#import <pthread.h>

@interface MyVc5 ()

@end

@implementation MyVc5

#pragma mark - C函数
void * _Nullable task(void * _Nullable params)
{
    //TODO.........
    return NULL;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建对象
    pthread_t thread = NULL;
    
    //创建线程
    //注意函数需要的参数
    //1.<#pthread_t  _Nullable *restrict _Nonnull#>:线程对象,传递地址
    //2.<#const pthread_attr_t *restrict _Nullable#>:线程属性
    //3.<#void * _Nullable (* _Nonnull)(void * _Nullable)#>:指向函数（方法）的指针
    //4.<#void *restrict _Nullable#>:函数需要接受的参数
    pthread_create(&thread, NULL, task, NULL);
    
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
