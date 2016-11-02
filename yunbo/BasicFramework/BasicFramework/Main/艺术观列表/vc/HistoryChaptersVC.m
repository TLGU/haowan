//
//  HistoryChaptersVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/2.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HistoryChaptersVC.h"
#import "HistoryChaptersVCCell.h"
@interface HistoryChaptersVC ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@end

@implementation HistoryChaptersVC

static NSString *HistoryChaptersVCID=@"HistoryChaptersVCID";

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-44) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
        [_tableView registerNib:[UINib nibWithNibName:@"HistoryChaptersVCCell" bundle:nil]
         forCellReuseIdentifier:HistoryChaptersVCID];
        
        _tableView.contentInset=UIEdgeInsetsMake(44, 0, 64, 0);
        _tableView.scrollIndicatorInsets=_tableView.contentInset;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark--
#pragma mark--life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    
    
}


#pragma mark--
#pragma mark--UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistoryChaptersVCCell *cell=[tableView dequeueReusableCellWithIdentifier:HistoryChaptersVCID forIndexPath:indexPath];
    if (indexPath.row%2==0) {
        cell.titleLabel.textColor=[UIColor redColor];
        cell.timeLabel.textColor=[UIColor redColor];
    }else{
        cell.titleLabel.textColor=[UIColor blackColor];
        cell.timeLabel.textColor=[UIColor blackColor];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
