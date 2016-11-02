//
//  ArtBaseListVC.m
//  BasicFramework
//
//  Created by 周航 on 16/10/30.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtBaseListVC.h"
#import "ArtListBaseCell.h"
@interface ArtBaseListVC ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@end

@implementation ArtBaseListVC
static NSString *ArtListBaseCellID=@"ArtListBaseCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49) style:UITableViewStylePlain];
        _tableView.tableHeaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
         _tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [_tableView registerNib:[UINib nibWithNibName:@"ArtListBaseCell" bundle:nil] forCellReuseIdentifier:ArtListBaseCellID];
        _tableView.contentInset=UIEdgeInsetsMake(44, 0, 0, 0);
        _tableView.scrollIndicatorInsets=_tableView.contentInset;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor=base_backGround_color;
    }
    return _tableView;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArtListBaseCell *cell=[tableView dequeueReusableCellWithIdentifier:ArtListBaseCellID forIndexPath:indexPath];
    if (indexPath.row%2==0) {
        cell.backImgV.image=[UIImage imageNamed:@"艺术家名片背景2"];
        cell.imgV.image=[UIImage imageNamed:@"art"];
    }else{
        cell.backImgV.image=[UIImage imageNamed:@"艺术家名片背景"];
        cell.imgV.image=[UIImage imageNamed:@"art2"];
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (kScreenHeight-64-44)/3.0f;
}



@end
