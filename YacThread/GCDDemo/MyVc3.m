
//
//  MyVc3.m
//  YacThread
//
//  Created by ChangWingchit on 2017/4/22.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MyVc3.h"

@interface MyVc3 ()

@property (nonatomic,strong) UIImageView *imageView1;
@property (nonatomic,strong) UIImageView *imageView2;

@end

@implementation MyVc3

#pragma mark - 测试顺序
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        [self download1];
    });
    
    dispatch_async(queue, ^{
        [self download2];
    });
    
    //栅栏函数：用于控制并发队列的执行顺序
    dispatch_barrier_async(queue, ^{
        NSLog(@"+++++++++++++++++++++++++++++");
    });
    
    dispatch_async(queue, ^{
        [self download3];
    });
}


#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //dispatch_get_main_queue() 获取主队列
    //dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>)获取全局队列
    /*
     <#long identifier#>:优先级
     #define DISPATCH_QUEUE_PRIORITY_HIGH 2
     #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0
     #define DISPATCH_QUEUE_PRIORITY_LOW (-2)
     <#unsigned long flags#>:默认0
     */
    //1.创建自线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //TODO....
        NSLog(@"TASK-----%@",[NSThread currentThread]);
        //更新UI需要回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            //TODO.....
             NSLog(@"UI-----%@",[NSThread currentThread]);
        });
        
    });
    
    [self delay];
    
#pragma mark ------------------ dispatch_group
    //队列组
    __block UIImage *image1 = nil, *image2 = nil;
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        //并行执行的线程一
        NSLog(@"执行线程1下载第一张图片");
        NSString *url = @"http://a0.att.hudong.com/22/90/01300000328622123485907859862_140.jpg";
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        image1 = [UIImage imageWithData:data];
    });
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        //并行执行的线程二
        NSLog(@"执行线程2下载第二张图片");
        NSString *url = @"http://112.74.108.147:6200/upload/c98acc41-5b07-4d48-9c87-c6f814340a04.jpg";
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        image2 = [UIImage imageWithData:data];
        
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0,0), ^{
        //并行的线程1与线程2执行结束后, 汇总结果
        NSLog(@"线程1与线程2执行结束后，显示下载的2图片");
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView1.image = image1;
            self.imageView2.image = image2;
        });
    });
#pragma mark -------------------- dispatch_group
    
}

#pragma mark - 延迟执行
- (void)delay
{
    //1
//    [self performSelector:@selector(justForTest) withObject:nil afterDelay:2.0];
  
    //2
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(justForTest) userInfo:nil repeats:NO];
 
    //3.GCD
    /*
     DISPATCH_TIME_NOW:从现在开始计算时间
     <#delayInSeconds#>:延迟的时间 2.0  GCD的时间单位是纳秒 *NSEC_PER_SEC = s
     dispatch_get_main_queue():队列 可以自定义
     */
    dispatch_queue_t myQueue = dispatch_get_main_queue();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), myQueue, ^{
          //TODO....
    });
}

#pragma mark - 只执行一次
//通常设计单例用
- (void)once
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //TODO.....
    });
}

#pragma mark - Test Method
- (void)justForTest
{
    NSLog(@"延迟实现");
}

- (void)download1
{
  NSLog(@"下载1");
}

- (void)download2
{
  NSLog(@"下载2");
}

- (void)download3
{
  NSLog(@"下载3");
}


#pragma mark - MemoryWarning
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
