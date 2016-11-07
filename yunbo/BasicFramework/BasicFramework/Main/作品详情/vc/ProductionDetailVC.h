//
//  ProductionDetailVC.h
//  BasicFramework
//
//  Created by mr_right on 16/10/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "BasicMainVC.h"
#import "Production.h"
@interface ProductionDetailVC : BasicMainVC
@property(assign,nonatomic)NSInteger rowIndex;

@property(strong,nonatomic)Production *production;







@end
