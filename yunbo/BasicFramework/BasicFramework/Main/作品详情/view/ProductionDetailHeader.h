//
//  ProductionDetailHeader.h
//  BasicFramework
//
//  Created by mr_right on 16/10/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductionDetailHeader : UIView
+(instancetype)header;
@property(assign,nonatomic)NSInteger rowIndex;


@property (strong, nonatomic) IBOutlet UIImageView *imgV;

@property (strong, nonatomic) IBOutlet UIImageView *header;
@end
