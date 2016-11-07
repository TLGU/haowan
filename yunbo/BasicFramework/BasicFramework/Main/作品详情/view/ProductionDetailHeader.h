//
//  ProductionDetailHeader.h
//  BasicFramework
//
//  Created by mr_right on 16/10/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Production.h"
@protocol ProductionDetailHeaderDelegate <NSObject>

-(void)popAction:(id)sender;

-(void)touchheaderAction:(id)sender;


@end

@interface ProductionDetailHeader : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
+(instancetype)header;
@property(assign,nonatomic)NSInteger rowIndex;

@property(strong,nonatomic)Production *production;



@property(weak,nonatomic)id<ProductionDetailHeaderDelegate> delegate;


@property (strong, nonatomic) IBOutlet UIImageView *imgV;

@property (strong, nonatomic) IBOutlet UIImageView *header;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


@property (strong, nonatomic) IBOutlet UILabel *artistIntroLabel;

@property (strong, nonatomic) IBOutlet UILabel *productionNameLabel;


@property (strong, nonatomic) IBOutlet UIView *bianQianView;


@property (strong, nonatomic) IBOutlet UILabel *fujiaInfoLabel;



@end
