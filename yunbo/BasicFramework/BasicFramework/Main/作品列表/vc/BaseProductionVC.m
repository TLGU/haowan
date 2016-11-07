//
//  BaseProductionVC.m
//  BasicFramework
//
//  Created by 周航 on 16/10/29.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "BaseProductionVC.h"
#import "RootCollectionViewCell.h"
#import "PuBuLiuLayout.h"
#import "ProductionListCell.h"
#import "ProductionDetailVC.h"
#import "Production.h"
@interface BaseProductionVC ()<UICollectionViewDataSource,UICollectionViewDelegate,PuBuLiuLayoutDelegate>

@end
static NSString *ProductionListCellID=@"ProductionListCellID";
@implementation BaseProductionVC
static NSString *reuseIdentifierForRootCell=@"reuseIdentifierRootViewController";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    

    
    
    
}



-(UICollectionView *)collectionView{
    if (!_collectionView) {
        PuBuLiuLayout *layout = [[PuBuLiuLayout alloc] init];
        layout.columnNumber = 2;
        layout.delegate = self;
        layout.padding = 5;
        layout.edgeInsets = UIEdgeInsetsMake(5, 5, 49, 5);
        _collectionView=[[UICollectionView  alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49) collectionViewLayout:layout];

        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.backgroundColor=base_backGround_color;
        _collectionView.contentInset=UIEdgeInsetsMake(44, 0, 0, 0);
        _collectionView.scrollIndicatorInsets=_collectionView.contentInset;
        [_collectionView registerNib:[UINib nibWithNibName:@"ProductionListCell"
                                                    bundle:nil] forCellWithReuseIdentifier:ProductionListCellID];
        
    }
    return _collectionView;
}
#pragma mark--UICollectionViewDataSource--UICollectionViewDataSource

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(kScreenWidth, 150);
    }else{
        return CGSizeZero;
    }
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView

{
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
    
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ProductionListCell *cell =   [collectionView dequeueReusableCellWithReuseIdentifier:ProductionListCellID forIndexPath:indexPath];


    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductionListCell *procell =(ProductionListCell*)  cell;
    Production *production=  self.dataArray[indexPath.row];
    procell.production=production;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    ProductionDetailVC *vc=[ProductionDetailVC new];
   
    Production *production=  self.dataArray[indexPath.row];
    vc.production=production;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
#pragma mark - layout的代理事件

- (CGFloat)puBuLiuLayoutHeightForItemAtIndex:(NSIndexPath *)index
{
    Production *production=  self.dataArray[index.row];
    CGFloat height= [production.pic_height floatValue]*(kScreenWidth/[production.pic_width floatValue]);
    
    return height ;
}


@end
