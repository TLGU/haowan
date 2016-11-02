//
//  HomePageCell.m
//  BasicFramework
//
//  Created by 周航 on 16/10/30.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HomePageCell.h"

@interface HomePageCell ()


@end

@implementation HomePageCell




- (UIButton *)btn {
    if (nil == _btn) {
        _btn = [[UIButton alloc] init];
//        _btn.titleLabel.font = kFT3;
        _btn.userInteractionEnabled = NO;
    }
    return _btn;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.imgV.layer.borderWidth=1.0;
    self.imgV.layer.borderColor=[UIColor grayColor].CGColor;
    
    self.imgV.layer.shadowColor=[UIColor blackColor].CGColor;
    self.imgV.layer.shadowOffset=CGSizeMake(5, 5);
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    
    /*
    {
        [self.contentView addSubview:self.btn];
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            //        make.left.top.right.bottom.equalTo(self.contentView);
            make.left.top.right.bottom.mas_equalTo(10);
            
        }];
        
        self.btn.layer.borderWidth=1.0;
        self.btn.layer.borderColor=[UIColor grayColor].CGColor;
        
        self.btn.layer.shadowColor=[UIColor blackColor].CGColor;
        self.btn.layer.shadowOffset=CGSizeMake(5, 5);
    }
   
    */
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setProduction:(Production *)production{
    _production=production;
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",YGBaseURL,_production.pic]];
    [self.imgV sd_setImageWithURL:url];
    
    
    
}




@end
