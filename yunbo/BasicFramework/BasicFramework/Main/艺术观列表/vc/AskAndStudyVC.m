//
//  AskAndStudyVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/2.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "AskAndStudyVC.h"
#import "AskAndStudyVCCell.h"
#define itemW (kScreenWidth-100)/5.0f
@interface AskAndStudyVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation AskAndStudyVC
static NSString *AskAndStudyVCCellID=@"AskAndStudyVCCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset=UIEdgeInsetsMake(0, 10, 0, 10);
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    layout.itemSize=CGSizeMake(itemW, itemW);
    layout.minimumLineSpacing=15;
    layout.minimumInteritemSpacing=1;
    [self.collectionView setCollectionViewLayout:layout];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"AskAndStudyVCCell" bundle:nil] forCellWithReuseIdentifier:AskAndStudyVCCellID];
    self.collectionView.showsHorizontalScrollIndicator=NO;
    
}
#pragma mark----
#pragma mark----<UICollectionViewDelegate,UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AskAndStudyVCCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:AskAndStudyVCCellID forIndexPath:indexPath];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
