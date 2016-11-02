//
//  ProductionDetailHeader.m
//  BasicFramework
//
//  Created by mr_right on 16/10/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ProductionDetailHeader.h"

@implementation ProductionDetailHeader
+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.header setCornerRad:30];
   
}


-(void)setRowIndex:(NSInteger)rowIndex{
    _rowIndex=rowIndex;
     self.imgV.image=[UIImage imageNamed:[NSString stringWithFormat:@"zuopin%ld",self.rowIndex]];
    
    
    
}

@end
