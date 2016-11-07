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

@property (strong, nonatomic) IBOutlet UILabel *moneyLabel;



@end

@implementation ProductionDetailHeader
static NSString *ArtistCellID=@"ArtistCellID";
+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(void)setProduction:(Production *)production
{
    _production=production;
    
    [self.imgV yg_setImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",YGBaseURL,_production.pic]] placeholderImage:[UIImage imageNamed:kDownloadImageHolder]];
    
   [self.header yg_setImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",YGBaseURL,_production.artist.picname]] placeholderImage:[UIImage imageNamed:kDownloadImageHolder]];
    
    self.nameLabel.text=_production.artist.realname;
    
    self.artistIntroLabel.text=_production.artist.zhiwei;
    
    self.productionNameLabel.text=_production.name;
    
    
    
    self.fujiaInfoLabel.text=[NSString stringWithFormat:@"%@/%@",_production.cicun,_production.years];
    
   CGFloat price= [_production.price_fen floatValue]/100.0f;
    self.moneyLabel.text=[NSString stringWithFormat:@"¥ %.2f",price];
    
    
    
    
    [self.yanBtn setTitle:[NSString stringWithFormat:@"%@",_production.viewcount] forState:UIControlStateNormal];
    
    
    
    [self.timeBtn setTitle:[NSString stringWithFormat:@"%@",_production.showTime] forState:UIControlStateNormal];
    
    
    
    
    
    
    
    
    
    
}

- (IBAction)moreSeenerAction:(id)sender {
}

- (IBAction)zanAction:(id)sender
{
//    face/user/nice_pub.do
    NSMutableDictionary *params= [NSMutableDictionary dictionary];
    params[@"pub_id"]=self.production.ID;
    [[NetWorkManager sharedInstance] requestDataForPOSTWithURL:@"face/user/nice_pub.do" parameters:nil Controller:nil success:^(id responseObject)
    {
        [SVProgressHUD showSuccessWithStatus:@""];
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
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
    return self.production.user_see_jsonArray.count;
}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    Artist *artist= self.production.user_see_jsonArray[indexPath.row];
    
    ArtistCell *cell=  [collectionView dequeueReusableCellWithReuseIdentifier:ArtistCellID forIndexPath:indexPath];
    
    cell.artist=artist;
    
    return cell;
}

@end
