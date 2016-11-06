//
//  ProductionDetailVC.m
//  BasicFramework
//
//  Created by mr_right on 16/10/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ProductionDetailVC.h"
#import "ProductionDetailHeader.h"
#import "ProductionDetailCell.h"
#import "CustomTransition.h"
#import "ProductionDetailCommentCell.h"
#import "SendMsgBar.h"

@interface ProductionDetailVC ()<UITableViewDelegate,UITableViewDataSource,ProductionDetailHeaderDelegate>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)ProductionDetailHeader *headerView;

@property(strong,nonatomic)SendMsgBar *sendBar;
@end

@implementation ProductionDetailVC
static NSString *ProductionDetailCellID=@"ProductionDetailCellID";
static NSString *ProductionDetailCommentCellID=@"ProductionDetailCommentCellID";

-(SendMsgBar *)sendBar{
    if (!_sendBar) {
        _sendBar=[SendMsgBar bar];
        [_sendBar setFrame:CGRectMake(0, kScreenHeight-44, kScreenWidth, 44)];
    }
    return _sendBar;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.hidesBottomBarWhenPushed =YES;
    }
    return self;
    
}
-(ProductionDetailHeader *)headerView{
    if (!_headerView) {
        _headerView=[ProductionDetailHeader header];
        _headerView.delegate=self;
        
    }
    return _headerView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.contentInset=UIEdgeInsetsMake(0, 0, 49, 0);
        _tableView.scrollIndicatorInsets=_tableView.contentInset;
        [_tableView registerNib:[UINib nibWithNibName:@"ProductionDetailCell" bundle:nil] forCellReuseIdentifier:ProductionDetailCellID];
        
         [_tableView registerNib:[UINib nibWithNibName:@"ProductionDetailCommentCell" bundle:nil] forCellReuseIdentifier:ProductionDetailCommentCellID];
        
        
        
        
        
        
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight*2/3+20)];
        [self.headerView setFrame:view.frame];
        [view addSubview:self.headerView];
        _tableView.tableHeaderView=view;
        _tableView.sectionHeaderHeight=0.1;
         _tableView.sectionFooterHeight=0.1;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        _tableView.showsVerticalScrollIndicator=NO;
        
    }
    return _tableView  ;
}

#pragma mark--
#pragma mark--life cycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"作品详情";
    _headerView.rowIndex=self.rowIndex;
    
    [self.view addSubview:self.tableView];
   
    WS(weakSelf)
    
    [[AppSingle Shared] addHeaderPullOnView:weakSelf.tableView waitTime:0 action:^{
        [weakSelf loadDataWithDataType:DataTypeDetail_Production andId:_production.ID scrollView:weakSelf.tableView isRefresh:YES finish:^(id value) {
            if ([value isKindOfClass:[Production class]]) {
                weakSelf.production=value;
                [weakSelf.tableView reloadData];
                weakSelf.headerView.production=weakSelf.production;
                
            }
        }];
    }];
    
    [[AppSingle Shared] headerBeginRefreshing:self.tableView];
    
    
    
    [self.view addSubview:self.sendBar];
    
    
}
-(void)popAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark--
#pragma mark--UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0)
    {
         return 1;
    }else{
        return 2;
    }
   
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
       
        ProductionDetailCell *cell=  [tableView dequeueReusableCellWithIdentifier:ProductionDetailCellID forIndexPath:indexPath];
        cell.production=self.production;
        return cell;
        
    }
    else
    {
        
        ProductionDetailCommentCell *cell=  [tableView dequeueReusableCellWithIdentifier:ProductionDetailCommentCellID forIndexPath:indexPath];
        cell.production=self.production;
        return cell;
    }
   
}
#pragma mark--
#pragma mark--UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0)
    {
        
        
        if (self.production.intro) {
            // NSData from the Base64 encoded str
            NSData *nsdataFromBase64String = [[NSData alloc]
                                              initWithBase64EncodedString:_production.intro options:0];
            
            // Decoded NSString from the NSData
            NSString *base64Decoded = [[NSString alloc]
                                       initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
            
          CGSize size=  [UIView sizeForNoticeTitle:base64Decoded font:[UIFont systemFontOfSize:14.0f]];
            return size.height+65;
        }else{
            return 65;
        }
        
        
    }else{
        
         return 120;
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }else{
        return 50;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(10, 15, kScreenWidth-20, 35)];
        [view addSubview:label];
        label.textColor=[UIColor blackColor];
        label.text=@"评论（2）";
        UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 15)];
        line.backgroundColor=kRGB(225, 225, 225);
        [view addSubview:line];
        UIView *lineb=[[UIView alloc] initWithFrame:CGRectMake(0, 49, kScreenWidth, 1)];
        lineb.backgroundColor=kRGB(225, 225, 225);
        [view addSubview:lineb];
          return view;
    }
   
    return 0;
    
  
}


@end
