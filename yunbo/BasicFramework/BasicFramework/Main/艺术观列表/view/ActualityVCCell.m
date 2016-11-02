//
//  ActualityVCCell.m
//  BasicFramework
//
//  Created by 周航 on 16/11/1.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ActualityVCCell.h"

@implementation ActualityVCCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
