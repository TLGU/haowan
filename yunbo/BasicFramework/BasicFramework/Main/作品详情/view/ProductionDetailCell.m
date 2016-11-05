//
//  ProductionDetailCell.m
//  BasicFramework
//
//  Created by mr_right on 16/10/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ProductionDetailCell.h"

@interface ProductionDetailCell ()
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;

@end
@implementation ProductionDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    self.contentTextView.userInteractionEnabled=NO;
    self.contentTextView.pagingEnabled=NO;
    self.contentTextView.pagingEnabled=NO;
    
}
-(void)setProduction:(Production *)production{
    _production=production;
    
    
//    if (_production.intro) {
//        // NSData from the Base64 encoded str
//        NSData *nsdataFromBase64String = [[NSData alloc]
//                                          initWithBase64EncodedString:_production.intro options:0];
//        
//        // Decoded NSString from the NSData
//        NSString *base64Decoded = [[NSString alloc]
//                                   initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
//        
//        //作品名称
//        self.contentTextView.text=_production.intro?base64Decoded:@"";
//    }else{
//        self.contentTextView.text=@"";
//    }
    
    
    
    
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
