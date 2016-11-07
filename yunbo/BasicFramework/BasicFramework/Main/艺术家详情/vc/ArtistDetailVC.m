//
//  ArtistDetailVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/7.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtistDetailVC.h"
#import "SectionHeaderNormal.h"
#import "ArtistHeaderView.h"
#import "JianJieCell.h"
#import "ZuoPingCell.h"
@interface ArtistDetailVC ()<UITableViewDelegate,UITableViewDataSource,ArtistHeaderViewDelegate>
@property(strong,nonatomic)UITableView *tableView;

@property(strong,nonatomic)ArtistHeaderView *headerView;

@end
@implementation ArtistDetailVC
static NSString *ArtistDetailVCZuoPingCellID=@"ArtistDetailVCZuoPingCellID";
static NSString *ArtistDetailVCJianJieCellID=@"ArtistDetailVCJianJieCellID";
-(ArtistHeaderView *)headerView{
    if (!_headerView) {
        _headerView=[ArtistHeaderView header];
        [_headerView setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight*0.5*0.9)];
        
        _headerView.delegate=self;
    }
    return _headerView;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed=YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=NO;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.contentInset=UIEdgeInsetsMake(0, 0, 49, 0);
        _tableView.scrollIndicatorInsets=_tableView.contentInset;
        _tableView.tableHeaderView=self.headerView;
        _tableView.sectionHeaderHeight=0.1;
        _tableView.sectionFooterHeight=0.1;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"ZuoPingCell" bundle:nil] forCellReuseIdentifier:ArtistDetailVCZuoPingCellID];
        [_tableView registerNib:[UINib nibWithNibName:@"JianJieCell" bundle:nil] forCellReuseIdentifier:ArtistDetailVCJianJieCellID];
    }
    return _tableView  ;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
          return 1;
    }else{
        return 3;
    }
  
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        JianJieCell *cell=[tableView dequeueReusableCellWithIdentifier:ArtistDetailVCJianJieCellID forIndexPath:indexPath];
        return cell;
    }else{
         ZuoPingCell *cell=[tableView dequeueReusableCellWithIdentifier:ArtistDetailVCZuoPingCellID forIndexPath:indexPath];
        return cell;
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        SectionHeaderNormal *sectionHeader=[SectionHeaderNormal headerWithTitle:@"简介"];
        [sectionHeader setFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        return sectionHeader;
    }else{
        SectionHeaderNormal *sectionHeader=[SectionHeaderNormal headerWithTitle:@"作品"];
        [sectionHeader setFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        return sectionHeader;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 120;
    }
    else{
        return 220;
    }
}

-(void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

