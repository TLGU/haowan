//
//  ArtGalleryBaseVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/3.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtGalleryBaseVC.h"
#import "ArtGalleryBaseVCCell.h"
#import "ArtGalleryDetailVC.h"
@interface ArtGalleryBaseVC ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@end

@implementation ArtGalleryBaseVC
static NSString *ArtGalleryBaseVCCellID=@"ArtGalleryBaseVCCellID";
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49) style:UITableViewStylePlain];
        _tableView.tableHeaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
        _tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [_tableView registerNib:[UINib nibWithNibName:@"ArtGalleryBaseVCCell" bundle:nil] forCellReuseIdentifier:ArtGalleryBaseVCCellID];
        _tableView.contentInset=UIEdgeInsetsMake(44, 0, 0, 0);
        _tableView.scrollIndicatorInsets=_tableView.contentInset;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor=base_backGround_color;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArtGalleryBaseVCCell *cell=[tableView dequeueReusableCellWithIdentifier:ArtGalleryBaseVCCellID forIndexPath:indexPath];
    if (indexPath.row%2==0) {
       
        cell.imgV.image=[UIImage imageNamed:@"guanzi1"];
    }else{
       
       cell.imgV.image=[UIImage imageNamed:@"guanzi2"];
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (kScreenHeight-64-44)/1.65f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ArtGalleryDetailVC *vc=[ArtGalleryDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
