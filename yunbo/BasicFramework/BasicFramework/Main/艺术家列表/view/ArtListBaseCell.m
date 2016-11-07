//
//  ArtListBaseCell.m
//  BasicFramework
//
//  Created by 周航 on 16/10/30.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtListBaseCell.h"



@interface ArtListBaseCell ()



@end



@implementation ArtListBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
    self.imgV.layer.borderWidth=1.5f;
    self.imgV.layer.borderColor=[UIColor whiteColor].CGColor;
    
    
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
//    self.backImgV.layer.borderWidth=1.0f;
//    self.backImgV.layer.borderColor=[UIColor grayColor].CGColor;
    
    self.contentView.backgroundColor=base_backGround_color;
    
    self.baseBackView.backgroundColor=[UIColor whiteColor];
//    self.baseBackView.layer.borderWidth=1.0f;
//    self.baseBackView.layer.borderColor=[UIColor grayColor].CGColor;
    
//    self.layer.borderWidth=1.0f;
//    self.layer.borderColor=[UIColor grayColor].CGColor;
    
//    self.layer.shadowOffset=CGSizeMake(3, 3);
//    self.layer.shadowOpacity = 1;//阴影透明度，默认0
//    self.layer.shadowRadius = 3;//阴影半径，默认3
    
    
    self.textView.userInteractionEnabled=NO;
    self.textView.scrollEnabled=NO;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
