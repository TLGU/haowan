//
//  ArtGalleryVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/3.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtGalleryVC.h"
#import "SGTopTitleView.h"
#import "ArtGalleryBaseVC.h"
@interface ArtGalleryVC ()<SGTopTitleViewDelegate,UIScrollViewDelegate>
@property(strong,nonatomic)NSArray *titles;
@property(strong,nonatomic)SGTopTitleView *topTitleView;
@property(strong,nonatomic)UIScrollView *mainScrollView;
@end

@implementation ArtGalleryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加所有子控制器
    [self setupChildViewController];
    
    self.title=@"艺术馆列表";
    
    self.titles = @[@"推荐", @"热门", @"最新", @"画廊",@"书法"];
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
    
    ArtGalleryBaseVC *oneVC = [[ArtGalleryBaseVC alloc] init];
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
    // 精选
    ArtGalleryBaseVC *oneVC = [[ArtGalleryBaseVC alloc] init];
    [self addChildViewController:oneVC];
    
    // 电视剧
    ArtGalleryBaseVC *twoVC = [[ArtGalleryBaseVC alloc] init];
    [self addChildViewController:twoVC];
    
    // 电影
    ArtGalleryBaseVC *threeVC = [[ArtGalleryBaseVC alloc] init];
    [self addChildViewController:threeVC];
    
    // 综艺
    ArtGalleryBaseVC *fourVC = [[ArtGalleryBaseVC alloc] init];
    [self addChildViewController:fourVC];
    
    // 综艺
    ArtGalleryBaseVC *fiveVC = [[ArtGalleryBaseVC alloc] init];
    [self addChildViewController:fiveVC];
    
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
