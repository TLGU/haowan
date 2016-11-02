//
//  ActualityVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/1.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ActualityVC.h"
#import "ActualityVCCell.h"
@interface ActualityVC ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;
@end

@implementation ActualityVC
static NSString *ActualityVCCellID=@"ActualityVCCellID";

#pragma mark--
#pragma mark--getter and setter
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-44) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
        [_tableView registerNib:[UINib nibWithNibName:@"ActualityVCCell" bundle:nil]
                              forCellReuseIdentifier:ActualityVCCellID];
        
        _tableView.contentInset=UIEdgeInsetsMake(44, 0, 64, 0);
        _tableView.scrollIndicatorInsets=_tableView.contentInset;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.tableView];
}

#pragma mark--
#pragma mark--UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActualityVCCell *cell=[tableView dequeueReusableCellWithIdentifier:ActualityVCCellID forIndexPath:indexPath];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}


@end
