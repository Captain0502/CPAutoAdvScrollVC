//
//  CPImageVC.m
//  MyDemo
//
//  Created by captain0502 on 2016/12/7.
//  Copyright © 2016年 captain0502. All rights reserved.
//

#import "CPImageVC.h"

@interface CPImageVC ()

@end

@implementation CPImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    BOOL ret = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:self.imageName]]; //  判断是否为有效url地址
    if (ret == YES) {
        //TODO: 如果要添加网络请求图片，请在此添加
    } else {
        self.contentIV.image = [UIImage imageNamed:self.imageName];
    }
    
}

@end
