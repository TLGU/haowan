//
//  ArtisticVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/1.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtisticVC.h"
#import "SGTopTitleView.h"
#import "ActualityVC.h"
#import "HistoryChaptersVC.h"
#import "AskAndStudyVC.h"
@interface ArtisticVC ()<UICollectionViewDelegate,UICollectionViewDataSource,SGTopTitleViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) SGTopTitleView *topTitleView;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation ArtisticVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"艺术观";
    //    [self.view addSubview:self.collectionView];
    
    
    // 1.添加所有子控制器
    [self setupChildViewController];
    
    
    
    self.titles = @[@"史学篇",@"现实篇",@"问学篇"];
    // , @"NBA", @"新闻", @"娱乐", @"音乐", @"网络电影"
    self.topTitleView = [SGTopTitleView topTitleViewWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    _topTitleView.staticTitleArr = [NSArray arrayWithArray:_titles];
    _topTitleView.isHiddenIndicator = NO;
    _topTitleView.delegate_SG = self;
    _topTitleView.titleAndIndicatorColor=base_control_color;
    [self.view addSubview:_topTitleView];
    
    // 创建底部滚动视图
    self.mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height);
    _mainScrollView.contentSize = CGSizeMake(kScreenWidth * _titles.count, 0);
    _mainScrollView.backgroundColor = [UIColor clearColor];
    // 开启分页
    _mainScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    _mainScrollView.bounces = NO;
    // 隐藏水平滚动条
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _mainScrollView.delegate = self;
    [self.view addSubview:_mainScrollView];
    
    HistoryChaptersVC *oneVC = [[HistoryChaptersVC alloc] init];
    [self.mainScrollView addSubview:oneVC.view];
    [self addChildViewController:oneVC];
    
    [self.view insertSubview:_mainScrollView belowSubview:_topTitleView];
    
    
    
    
}


#pragma mark - - - SGTopScrollMenu代理方法
- (void)SGTopTitleView:(SGTopTitleView *)topTitleView didSelectTitleAtIndex:(NSInteger)index{
    
    // 1 计算滚动的位置
    CGFloat offsetX = index * kScreenWidth;
    self.mainScrollView.contentOffset = CGPointMake(offsetX, 0);
    
    // 2.给对应位置添加对应子控制器
    [self showVc:index];
}

// 添加所有子控制器
- (void)setupChildViewController {
    // 精选ActualityVC
    HistoryChaptersVC *oneVC = [[HistoryChaptersVC alloc] init];
    [self addChildViewController:oneVC];
    
    // 电视剧
    ActualityVC *twoVC = [[ActualityVC alloc] init];
    [self addChildViewController:twoVC];
    
    // 电影
    AskAndStudyVC *threeVC = [[AskAndStudyVC alloc] init];
    [self addChildViewController:threeVC];
    
       
}

// 显示控制器的view
- (void)showVc:(NSInteger)index {
    
    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    
    [self.mainScrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // 1.添加子控制器view
    [self showVc:index];
    
    // 2.把对应的标题选中
    UILabel *selLabel = self.topTitleView.allTitleLabel[index];
    
    // 3.滚动时，改变标题选中
    [self.topTitleView staticTitleLabelSelecteded:selLabel];
    
}


@end
