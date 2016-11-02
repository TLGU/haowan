//
//  HomePageCell.h
//  BasicFramework
//
//  Created by 周航 on 16/10/30.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Production.h"
@interface HomePageCell : UITableViewCell
@property(strong,nonatomic)Production *production;
@property (nonatomic, strong) UIButton *btn;
@property (strong, nonatomic) IBOutlet UIImageView *imgV;
@end
