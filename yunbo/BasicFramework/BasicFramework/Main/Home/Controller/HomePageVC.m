//
//  HomePageVC.m
//  BasicFramework
//
//  Created by 周航 on 16/10/30.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HomePageVC.h"
#import "HomeHeaderView.h"
#import "HomePageCell.h"
#import "HomePageHotCell.h"
#import "ProductionListVC.h"
#import "ArtListVC.h"
#import "HomePageSectionView.h"
#import "ProductionIndex.h"
#import "ArtListVC.h"
@interface HomePageVC ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)HomeHeaderView *header;
@property(strong,nonatomic)NSMutableArray *productions;
@property(nonatomic, strong) HomePageCell *cell;
@end

@implementation HomePageVC
static NSString *HomePageCellID=@"HomePageCellID";
static NSString *HomePageHotCellID=@"HomePageHotCellID";
#pragma mark--
#pragma mark--life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
     WeakSelf(weakSelf)
    
    
    
    [[AppSingle Shared] addHeaderPullOnView:self.tableView waitTime:0.0f action:^{
        [weakSelf loadNewData];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:LoadHomePageNewData object:nil];
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         [weakSelf loadNewData];
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
    
   
    
    
}



-(void)loadNewData
{
    WeakSelf(weakSelf)
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"secondPubConlumnId"]=@"5812ef5478e0802052dd7a2f";
    [[NetWorkManager sharedInstance] requestDataForPOSTWithURL:@"front/list_pub.do" parameters:params Controller:self success:^(id responseObject) {
        NSArray *arr=  responseObject[@"data"];
        
        self.productions=  [ProductionIndex mj_objectArrayWithKeyValuesArray:arr];
        NSLog(@"%@",arr);
        [weakSelf.tableView reloadData];
        [[AppSingle Shared] headerEndRefreshingOnView:self.tableView];
        
    } failure:^(NSError *error) {
         [[AppSingle Shared] headerEndRefreshingOnView:self.tableView];
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=NO;
}


#pragma mark--
#pragma mark--getter and setter

-(NSMutableArray *)productions{
    if (!_productions) {
        _productions=[NSMutableArray array];
    }
    return _productions;
}
-(HomeHeaderView *)header{
    if (!_header) {
        _header=[HomeHeaderView headerView];
        [_header setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight*0.5)];
    }
    return _header;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc ] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableHeaderView=self.header;
        [_tableView registerNib:[UINib nibWithNibName:@"HomePageCell" bundle:nil] forCellReuseIdentifier:HomePageCellID];
        [_tableView registerNib:[UINib nibWithNibName:@"HomePageHotCell" bundle:nil] forCellReuseIdentifier:HomePageHotCellID];
        _tableView.contentInset=UIEdgeInsetsMake(0, 0, 49, 0);
        _tableView.scrollIndicatorInsets=_tableView.contentInset;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        
       
        
    }
    return _tableView;
}

#pragma mark--
#pragma mark--UITableViewDataSource,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return self.productions.count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        HomePageHotCell *cell=  [tableView dequeueReusableCellWithIdentifier:HomePageHotCellID forIndexPath:indexPath];
        
        return cell;
    }
    
    else
    {
//        Production *production=  self.productions[indexPath.row];
        HomePageCell *cell=  [tableView dequeueReusableCellWithIdentifier:HomePageCellID forIndexPath:indexPath];
        
//        cell.production=production;
        
        [self configureCell:cell atIndexPath:indexPath];
        
        
        
        
        
        
        return cell;
    }
    
}

- (void)configureCell:(HomePageCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    ProductionIndex *production=self.productions[indexPath.row];
    NSString *imgURL =[NSString stringWithFormat:@"%@%@",YGBaseURL,production.pic] ;
    UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgURL];
    
    if ( !cachedImage ) {
        [self downloadImage:imgURL forIndexPath:indexPath];
//        [cell.btn setBackgroundImage:[UIImage imageNamed:@"kDownloadImageHolder"] forState:UIControlStateNormal];
        [cell.imgV setImage:[UIImage imageNamed:@"kDownloadImageHolder"]];
    } else {
//        [cell.btn setBackgroundImage:cachedImage forState:UIControlStateNormal];
        
        [cell.imgV setImage:cachedImage];
        
    }
}

- (void)downloadImage:(NSString *)imageURL forIndexPath:(NSIndexPath *)indexPath {
    // 利用 SDWebImage 框架提供的功能下载图片
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imageURL] options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // do nothing
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        [[SDImageCache sharedImageCache] storeImage:image forKey:imageURL toDisk:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}





-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section!=0) {

        ProductionIndex *production=self.productions[indexPath.row];
        NSString *imgURL =[NSString stringWithFormat:@"%@%@",YGBaseURL,production.pic] ;
        
        // 先从缓存中查找图片
        UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey: imgURL];
        
        // 没有找到已下载的图片就使用默认的占位图，当然高度也是默认的高度了，除了高度不固定的文字部分。
        if (!image) {
            image = [UIImage imageNamed:@"kDownloadImageHolder"];
        }
        
        //手动计算cell
        CGFloat imgHeight = image.size.height * [UIScreen mainScreen].bounds.size.width / image.size.width;
        return imgHeight+20;
        
    }else{
        return 200;
    }
    
    
    
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   
    if (section==0) {
         HomePageSectionView *view=[HomePageSectionView view];
        [view setFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        view.title=@"● 热门 ●";
        return view;
    }else{
        HomePageSectionView *view=[HomePageSectionView view];
        [view setFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        view.title=@"● 最新 ●";
        return view;
    }
   
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section!=0)
//    {
//        ProductionListVC *vc=[ProductionListVC new];
//        [self.navigationController pushViewController:vc animated:YES];
//    }else{
//        ArtListVC *vc=[ArtListVC new];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//    else
//    {
//        ArtListVC *vc=[ArtListVC new];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
    
}
#pragma mark--
#pragma mark--life cycle


@end
