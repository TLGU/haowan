//
//  ProductionDetailHeader.m
//  BasicFramework
//
//  Created by mr_right on 16/10/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ProductionDetailHeader.h"
#import "ArtistCell.h"
#import "BasicMainTBC.h"
#define itemW 60
@interface ProductionDetailHeader ()

@property (strong, nonatomic) IBOutlet UIButton *yanBtn;

@property (strong, nonatomic) IBOutlet UIButton *timeBtn;


@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;



@end

@implementation ProductionDetailHeader
static NSString *ArtistCellID=@"ArtistCellID";
+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}



- (IBAction)moreSeenerAction:(id)sender {
}

- (IBAction)zanAction:(id)sender {
}
- (IBAction)guanzhuAction:(id)sender {
}
- (IBAction)songLiAction:(id)sender {
}


- (IBAction)backAction:(id)sender {
    
    
    if (self.delegate) {
        [self.delegate popAction:sender];
    }
}



-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.header setCornerRad:30];
    
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ArtistCell" bundle:nil] forCellWithReuseIdentifier:ArtistCellID];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize=CGSizeMake(itemW, itemW);
    layout.minimumLineSpacing=15;
    layout.minimumInteritemSpacing=1;
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:layout];
    
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.showsHorizontalScrollIndicator=NO;
    
   
}


-(void)setRowIndex:(NSInteger)rowIndex
{
    _rowIndex=rowIndex;
     self.imgV.image=[UIImage imageNamed:[NSString stringWithFormat:@"zuopin%ld",self.rowIndex]];
    
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ArtistCell *cell=  [collectionView dequeueReusableCellWithReuseIdentifier:ArtistCellID forIndexPath:indexPath];
    return cell;
}

@end
