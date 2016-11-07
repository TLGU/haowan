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

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@property (strong, nonatomic) IBOutlet UIButton *goodBtn;



@end

@implementation ProductionDetailCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.headerBtn setCornerRad:30];
//    self.selectionStyle=UITableViewCellSelectionStyleNone;

}

- (IBAction)goodAction:(UIButton *)sender {
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setProduction:(Production *)production{
//    _production =production;
//    
//    
//    
//    
//    [self.headerBtn sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",YGBaseURL,_production.artist.picname]] forState:UIControlStateNormal];
//    
//    self.nameLabel.text=_production.artist.realname;
    
    
    
    
    
    
    
    
    
}

-(void)setCommenter:(Commenter *)commenter{
    _commenter=commenter;
    
    [self.headerBtn sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",YGBaseURL,_commenter.user_logo]] forState:UIControlStateNormal];
    
    self.nameLabel.text=_commenter.user_show_name;
    
    
    
    [self.goodBtn setTitle:[NSString stringWithFormat:@"%@",_commenter.nice_count] forState:UIControlStateNormal];
    
    
    self.timeLabel.text=_commenter.showTime;
    
    
    if (commenter.content) {
        NSData *nsdataFromBase64String = [[NSData alloc]
                                          initWithBase64EncodedString:commenter.content options:0];
        
        // Decoded NSString from the NSData
        NSString *base64Decoded = [[NSString alloc]
                                   initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
        
        self.contentLabel.text=base64Decoded;
    }
    
  
    
    
    
}
@end
