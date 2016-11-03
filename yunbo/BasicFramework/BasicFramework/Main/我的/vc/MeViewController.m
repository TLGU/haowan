//
//  MeViewController.m
//  BasicFramework
//
//  Created by 周航 on 16/11/2.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "MeViewController.h"
#import "MeHeader.h"
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)MeHeader *header;
@property(strong,nonatomic)NSMutableArray *dataArr;
@end

@implementation MeViewController
static NSString *meCellID=@"meCellID";
#pragma mark--
#pragma mark--getter and setter
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr=[NSMutableArray array];
        NSMutableArray *arr0=[NSMutableArray array];
        NSMutableArray *arr1=[NSMutableArray array];
        NSMutableArray *arr2=[NSMutableArray array];
        
        
        NSMutableDictionary *mdic00=[NSMutableDictionary dictionary];
        mdic00[@"icon"]=@"me_production_qiang";
        mdic00[@"title"]=@"作品墙";
        [arr0 addObject:mdic00];
        
        NSMutableDictionary *mdic10=[NSMutableDictionary dictionary];
        mdic10[@"icon"]=@"me_mingpian";
        mdic10[@"title"]=@"我的名片";
        [arr1 addObject:mdic10];
        NSMutableDictionary *mdic11=[NSMutableDictionary dictionary];
        mdic11[@"icon"]=@"me_comment";
        mdic11[@"title"]=@"我的评论";
        [arr1 addObject:mdic11];
        
        NSMutableDictionary *mdic20=[NSMutableDictionary dictionary];
        mdic20[@"icon"]=@"me_about";
        mdic20[@"title"]=@"关于多好玩";
        [arr2 addObject:mdic20];
        NSMutableDictionary *mdic21=[NSMutableDictionary dictionary];
        mdic21[@"icon"]=@"me_fankui";
        mdic21[@"title"]=@"意见反馈";
        [arr2 addObject:mdic21];
        
        
        
        
        
        [_dataArr addObject:arr0];
        [_dataArr addObject:arr1];
        [_dataArr addObject:arr2];
        
    }
    return _dataArr;
}
-(MeHeader *)header{
    if (!_header) {
        _header=[MeHeader header];
        [_header setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight*0.4)];
    }
    return _header;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableHeaderView=self.header;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:meCellID];
    }
    return _tableView;
}

#pragma mark--
#pragma mark--life cycle
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
#pragma mark--
#pragma mark--<UITableViewDelegate,UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
NSArray *arr=    self.dataArr[indexPath.section] ;
  NSMutableDictionary *mdic=  arr[indexPath.row];
   NSString *icon= mdic[@"icon"];
    NSString *title= mdic[@"title"];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:meCellID forIndexPath:indexPath];
    cell.imageView.image=[UIImage imageNamed:icon];
    cell.textLabel.text=title;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end
