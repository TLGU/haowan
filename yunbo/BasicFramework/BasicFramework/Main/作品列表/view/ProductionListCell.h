//
//  ProductionListCell.h
//  BasicFramework
//
//  Created by 周航 on 16/10/29.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Production.h"
@interface ProductionListCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgV;
@property(strong,nonatomic) Production *production;
@end
