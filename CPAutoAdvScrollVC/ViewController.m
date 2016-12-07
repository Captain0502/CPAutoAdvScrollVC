//
//  ViewController.m
//  CPAutoAdvScrollVC
//
//  Created by captain0502 on 2016/12/7.
//  Copyright © 2016年 captain0502. All rights reserved.
//

#import "ViewController.h"
#import "CPAutoScollAdvVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 用来展示欢迎页
//    CPAutoScollAdvVC *advVC = [[CPAutoScollAdvVC alloc] initWithFrame:self.view.bounds];
    
    //  用来展示自动滚屏广告
    CPAutoScollAdvVC *advVC = [[CPAutoScollAdvVC alloc] initWithFrame:CGRectMake(0,
                                                                                 0,
                                                                                 self.view.bounds.size.width,
                                                                                 300)];
    advVC.shoudAutoScroll = YES;
    advVC.shouldLoop = YES;
    advVC.imagePathsArray = @[@"guide1_iPhone5",@"guide2_iPhone5",@"guide3_iPhone5",@"guide4_iPhone5"];
    advVC.currentPageIndicatorTintColor = [UIColor redColor];
    advVC.pageIndicatorTintColor = [UIColor greenColor];
    
    [self addChildViewController:advVC];
    
    [self.view addSubview:advVC.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
