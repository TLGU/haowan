//
//  ProductionListCell.m
//  BasicFramework
//
//  Created by 周航 on 16/10/29.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ProductionListCell.h"

@interface ProductionListCell ()

@property (strong, nonatomic) IBOutlet UIButton *goodBtn;
@property (strong, nonatomic) IBOutlet UIButton *xinBtn;
@property (strong, nonatomic) IBOutlet UILabel *productionNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ArtistLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *headerImgV;

@end
@implementation ProductionListCell

-(void)setProduction:(Production *)production{
    _production=production;
    
    [self.imgV yg_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",YGBaseURL,_production.pic]]
                 placeholderImage:[UIImage imageNamed:@"kDownloadImageHolder"]
                         progress:^(NSInteger receivedSize, NSInteger expectedSize)
    {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
    {
        
    }];
    
    //点赞数
    [self.goodBtn setTitle:[NSString stringWithFormat:@"%@",_production.nice_count?_production.nice_count:@"0"] forState:UIControlStateNormal];
    //喜欢数（收藏）
    
    [self.xinBtn setTitle:[NSString stringWithFormat:@"%@",_production.shoucang_count?_production.shoucang_count:@"0"] forState:UIControlStateNormal];
    
    if (_production.intro) {
        // NSData from the Base64 encoded str
        NSData *nsdataFromBase64String = [[NSData alloc]
                                          initWithBase64EncodedString:_production.intro options:0];
        
        // Decoded NSString from the NSData
        NSString *base64Decoded = [[NSString alloc]
                                   initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
        
        //作品名称
        self.productionNameLabel.text=_production.intro?base64Decoded:@"";
    }else{
        self.productionNameLabel.text=@"";
    }
    
    
    
    
    
    //作者名字
    self.ArtistLabel.text=_production.zuozhe;
    
    //作品简介
    self.contentLabel.text=_production.name;
    
    
    
    
    
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}

@end
