//
//  ProductionDetailCommentCell.h
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Production.h"
#import "Commenter.h"
@interface ProductionDetailCommentCell : UITableViewCell
@property(strong,nonatomic)Production *production;
@property(strong,nonatomic) Commenter *commenter;
@end
