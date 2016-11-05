//
//  ProductionListCell.m
//  BasicFramework
//
//  Created by 周航 on 16/10/29.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ProductionListCell.h"

@interface ProductionListCell ()


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
    
    
    
    
}



- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}

@end
