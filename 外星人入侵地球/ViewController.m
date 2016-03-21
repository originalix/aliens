//
//  ViewController.m
//  外星人入侵地球
//
//  Created by Lix on 16/3/21.
//  Copyright © 2016年 Lix. All rights reserved.
//

#import "ViewController.h"

#define Green NSLog(@"第10个人的帽子是绿色的")
#define Red   NSLog(@"第10个人的帽子是红色的")

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self Alienware];
}

- (void)Alienware
{
    /**
     *  定义一个数组，里面有十个对象，类比为十个人，R代表该对象头上戴着red帽子，G代表该对象头上戴着Green帽子，颜色随机。
     */
    NSArray * array = [NSArray arrayWithObjects:@"R",@"G",@"R",@"R",@"G",@"R",@"R",@"G",@"G",@"R",nil];
    
    NSInteger r = 0;
    NSInteger g = 0;
    
    for (int i = 0 ; i < 9; i++) {
        
        if ([array[i] isEqualToString:@"R"]) {
            r++;
        }else if ([array[i]isEqualToString:@"G"]){
            g++;
        }
    }
    
//    NSLog(@"G = %ld, R = %ld",g,r);
    
    g % 2 == 0 ? Red : Green;    //这是第十个人的回答
    
    
    //定义deleteR和deleteG分别为排除掉的人的帽子数量 R为红色 G为绿色
    
    NSInteger deleteR = 0;
    NSInteger deleteG = 0;
  
    /**
     *  n为在第九个人之前的八个人，因为第十个人已经回答完，从第九个人开始观察之前的8个人。
     */
    for (int n = 8; n >= 0 ; n--) {
        
        //计数器，记录排在前面的人的红帽子和绿帽子的数量
        NSInteger beforeR = 0;
        NSInteger beforeG = 0;
        
        //每一个人在回答前，都统计遍历一遍自己之前的数据，完成计数
        for (int i = 0; i < n; i++) {
            
            if ([array[i] isEqualToString:@"R"]) {
                beforeR++;
            }else if ([array[i]isEqualToString:@"G"]){
                beforeG++;
            }
        }
        
//        NSLog(@"G = %ld, R = %ld",beforeG,beforeR);
        

        //判断自己到底是什么颜色的帽子 条件很简单 就是判断奇偶性
        if ( (beforeG + deleteG) % 2 != 0 ) {
            NSLog(@"第%d个人的帽子是绿色的",n+1);
            ++deleteG;
        } else if ((beforeR + deleteR) % 2 == 0)
        {
            NSLog(@"第%d个人的帽子是红色的",n+1);
            ++deleteR;
        }
        
        
    }
    
    

}





//2016-03-21 17:30:45.229 外星人入侵地球[21432:3513416] 第10个人的帽子是红色的
//2016-03-21 17:30:45.230 外星人入侵地球[21432:3513416] 第9个人的帽子是绿色的
//2016-03-21 17:30:45.230 外星人入侵地球[21432:3513416] 第8个人的帽子是绿色的
//2016-03-21 17:30:45.230 外星人入侵地球[21432:3513416] 第7个人的帽子是红色的
//2016-03-21 17:30:45.231 外星人入侵地球[21432:3513416] 第6个人的帽子是红色的
//2016-03-21 17:30:45.231 外星人入侵地球[21432:3513416] 第5个人的帽子是绿色的
//2016-03-21 17:30:45.231 外星人入侵地球[21432:3513416] 第4个人的帽子是红色的
//2016-03-21 17:30:45.231 外星人入侵地球[21432:3513416] 第3个人的帽子是红色的
//2016-03-21 17:30:45.232 外星人入侵地球[21432:3513416] 第2个人的帽子是绿色的
//2016-03-21 17:30:45.232 外星人入侵地球[21432:3513416] 第1个人的帽子是红色的

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
