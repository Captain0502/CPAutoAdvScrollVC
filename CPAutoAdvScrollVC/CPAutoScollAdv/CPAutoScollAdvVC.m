//
//  CPAutoScollAdvVC.m
//  MyDemo
//
//  Created by captain0502 on 2016/12/7.
//  Copyright © 2016年 captain0502. All rights reserved.
//

#import "CPAutoScollAdvVC.h"
#import "CPImageVC.h"

#define ViewSize_Height     self.view.frame.size.height
#define ViewSize_Width      self.view.frame.size.width

@interface CPAutoScollAdvVC ()

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation CPAutoScollAdvVC {
    NSUInteger currenIndex;
    
    CPImageVC *willTransitonVC;//保存当前将要跳转到控制器
}

- (id)initWithFrame:(CGRect )frame {
    if (self = [super init]) {
    CPAutoScollAdvVC *advVC = [[CPAutoScollAdvVC alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        advVC.view.frame = frame;
        
        return advVC;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.delegate = self;
    self.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImagePathsArray:(NSArray<NSString *> *)imagePathsArray {
    _imagePathsArray = imagePathsArray;
    
    CPImageVC *intializedVC = [self controllerAtIndex:0];
    if (self.shoudAutoScroll == YES) {  //  进行自动滚动
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    } else {                            //  设置初始加在界面
        [self setViewControllers:@[intializedVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        self.pageControl.currentPage = 0;
    }
}
//  计时器事件
- (void)timerAction:(NSTimer *)timer {
    currenIndex++;
    if (currenIndex > self.imagePathsArray.count - 1) {
        currenIndex = 0;
    }
    self.pageControl.currentPage = currenIndex;
    
    CPImageVC *intializedVC = [self controllerAtIndex:currenIndex];
    [self setViewControllers:@[intializedVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma mark - getter and setter methods
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, ViewSize_Height - 50, ViewSize_Width,50)];
        _pageControl.numberOfPages = self.imagePathsArray.count;
        _pageControl.pageIndicatorTintColor = self.pageIndicatorTintColor;
        _pageControl.currentPageIndicatorTintColor = self.currentPageIndicatorTintColor;
        [self.view addSubview:_pageControl];
    }
    
    return _pageControl;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(CPImageVC *)viewController];
    if (index == 0) {
        if (self.shouldLoop == YES) {
            return [self controllerAtIndex:self.imagePathsArray.count - 1];  //需要循环滚动的话跳转到最后一个
        }
        
        return nil;
    }
    
    return [self controllerAtIndex:index - 1];
}

#pragma mark - UIPageViewControllerDelegate and UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(CPImageVC *)viewController];
    if (index == self.imagePathsArray.count - 1) {
        if (self.shouldLoop == YES) {
            return [self controllerAtIndex:0];   //需要循环滚动的话跳转到第一个
        }
        return nil;
    }
    
    return [self controllerAtIndex:index + 1];
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    willTransitonVC = (CPImageVC *)pendingViewControllers.lastObject;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed == YES) {
        NSUInteger willTransitionIndex = [self indexOfViewController:willTransitonVC];
        currenIndex = willTransitionIndex;
        self.pageControl.currentPage = currenIndex;
    }
}

#pragma mark - 通过下标获取控制器#pragma mark - 获取控制器的下标
- (NSUInteger)indexOfViewController:(CPImageVC *)vc {
    NSUInteger index = [self.imagePathsArray indexOfObject:vc.imageName];
    if (index != NSNotFound) {
        return index;
    } else {
        return 0;
    }
}

- (CPImageVC *)controllerAtIndex:(NSUInteger)index {
    NSString *imageName = [self.imagePathsArray objectAtIndex:index];
    
    CPImageVC *imageVC = [[CPImageVC alloc] init];
    imageVC.imageName = imageName;
    
    return imageVC;
}

@end
