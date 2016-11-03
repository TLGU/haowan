//
//  ArtGalleryBaseVCCell.m
//  BasicFramework
//
//  Created by 周航 on 16/11/3.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtGalleryBaseVCCell.h"


@interface ArtGalleryBaseVCCell ()
@property (strong, nonatomic) IBOutlet UIButton *headerButton;
@property (strong, nonatomic) IBOutlet UIButton *guanzhuBtn;
@property (strong, nonatomic) IBOutlet UIButton *huisuoBtn;

@end





@implementation ArtGalleryBaseVCCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    [self.headerButton setCornerRad:30];
    
    
    self.guanzhuBtn.layer.borderWidth=1;
    self.guanzhuBtn.layer.borderColor=[UIColor blackColor].CGColor;
    [self.guanzhuBtn setCornerRad:10];
    [self.huisuoBtn setCornerRad:4];
    
    
    
    self.imgV.layer.borderColor=[UIColor grayColor].CGColor;
    self.imgV.layer.borderWidth=1.0f;
}
- (IBAction)guanZhuAction:(id)sender {
}
- (IBAction)headerAction:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
