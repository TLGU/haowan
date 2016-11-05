//
//  ProductionDetailCommentCell.m
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ProductionDetailCommentCell.h"

@interface ProductionDetailCommentCell ()
@property (strong, nonatomic) IBOutlet UIButton *headerBtn;

@end

@implementation ProductionDetailCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.headerBtn setCornerRad:30];
    self.selectionStyle=UITableViewCellSelectionStyleNone;

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}



@end
