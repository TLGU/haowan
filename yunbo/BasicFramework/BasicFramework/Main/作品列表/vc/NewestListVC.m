//
//  NewestListVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "NewestListVC.h"

@interface NewestListVC ()

@end

@implementation NewestListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf(weakSelf)
    void (^loadData)(BOOL isRefresh )=^(BOOL isRefresh){
        [weakSelf loadDataWithDataType:DataTypeList_NewProduction andId:nil scrollView:weakSelf.collectionView isRefresh:isRefresh finish:^(id value) {
            if ([value boolValue]) {
                [weakSelf.collectionView reloadData];
            }else{
                
            }
        }];
    };
    
    [[AppSingle Shared] addHeaderPullOnView:self.collectionView waitTime:0 action:^{
        loadData(YES);
    }];
    [[AppSingle Shared] addFooderPullOnView:self.collectionView waitTime:0 action:^{
        loadData(NO);
    }];
    [[AppSingle Shared] headerBeginRefreshing:self.collectionView];
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
