//
//  Artist_ShuHuaListVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/7.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "Artist_ShuHuaListVC.h"

@interface Artist_ShuHuaListVC ()

@end

@implementation Artist_ShuHuaListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf(weakSelf)
    void (^loadData)(BOOL isRefresh )=^(BOOL isRefresh){
        [weakSelf loadDataWithDataType:DataTypeList_Artist andId:@"画家" scrollView:weakSelf.tableView isRefresh:isRefresh finish:^(id value) {
            if ([value boolValue]) {
                [weakSelf.tableView reloadData];
            }else{
                
            }
        }];
    };
    
    [[AppSingle Shared] addHeaderPullOnView:self.tableView waitTime:0 action:^{
        loadData(YES);
    }];
    [[AppSingle Shared] addFooderPullOnView:self.tableView waitTime:0 action:^{
        loadData(NO);
    }];
    [[AppSingle Shared] headerBeginRefreshing:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
