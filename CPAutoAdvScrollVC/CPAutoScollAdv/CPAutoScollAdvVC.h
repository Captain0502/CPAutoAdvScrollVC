//
//  CPAutoScollAdvVC.h
//  MyDemo
//
//  Created by captain0502 on 2016/12/7.
//  Copyright © 2016年 captain0502. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPAutoScollAdvVC : UIPageViewController<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray <NSString *>*imagePathsArray; // 传的图片地址

@property (nonatomic, assign) BOOL shouldLoop;  //  设置是否可能进行循环滚动
@property (nonatomic, assign) BOOL shoudAutoScroll; //  设置是否需要自动滚动

@property (nonatomic, strong) UIColor *pageIndicatorTintColor;  //  指示灯的颜色
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;   //  当前指示灯的颜色

- (id)initWithFrame:(CGRect )frame;

@end
