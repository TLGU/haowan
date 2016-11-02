//
//  HomePageHotCell.m
//  BasicFramework
//
//  Created by 周航 on 16/10/30.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HomePageHotCell.h"
#import "HomePageHotCollectionCell.h"
#import "HotItem.h"
#import <JSONModel.h>
#define itemsWidth  (kScreenWidth-70)/2.0f
#define itemsHeight 180
@interface HomePageHotCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(strong,nonatomic)UICollectionView *collectionView;
@property(strong,nonnull)NSMutableArray *hotItems;
@end

@implementation HomePageHotCell
-(NSMutableArray *)hotItems{
    if (!_hotItems) {
        _hotItems=[NSMutableArray array];
    }
    return _hotItems;
}
static NSString *HomePageHotCollectionCellID=@"HomePageHotCollectionCellID";

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset=UIEdgeInsetsMake(0, 20, 0, 20);
        layout.itemSize=CGSizeMake(itemsWidth, itemsHeight);
        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing=15;
        layout.minimumInteritemSpacing=10;
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200) collectionViewLayout:layout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        [_collectionView registerNib:[UINib nibWithNibName:@"HomePageHotCollectionCell" bundle:nil] forCellWithReuseIdentifier:HomePageHotCollectionCellID];
        _collectionView.backgroundColor=base_backGround_color;
        _collectionView.showsHorizontalScrollIndicator=NO;
    }
    return _collectionView;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.contentView addSubview:self.collectionView];
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [self loadData:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData:) name:LoadHomePageNewData object:nil];
    
   
    
}

-(void)loadData:(id)sender{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"rootPubConlumnId"]=@"57fca56def722c216b767c91";
    params[@"tag_type"]=@"2";
    WeakSelf(weakSelf)
    [[NetWorkManager sharedInstance] requestDataForPOSTWithURL:@"front/list_pub.do" parameters:params Controller:nil success:^(id responseObject) {
        NSArray *dics=  responseObject[@"data"];
        weakSelf.hotItems=[HotItem mj_objectArrayWithKeyValuesArray:dics];
        [weakSelf.collectionView reloadData];
        
    } failure:^(NSError *error)
     {
         
     }];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.hotItems.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   HotItem *hotItem= self.hotItems[indexPath.row];
    HomePageHotCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:HomePageHotCollectionCellID forIndexPath:indexPath];
    cell.hotItem=hotItem;
    return cell;
}


@end
