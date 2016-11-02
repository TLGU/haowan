//
//  HomePageHotCollectionCell.m
//  BasicFramework
//
//  Created by 周航 on 16/10/31.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HomePageHotCollectionCell.h"

@interface HomePageHotCollectionCell ()
@property (strong, nonatomic) IBOutlet UIImageView *imgV;

@end


@implementation HomePageHotCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.borderColor=[UIColor grayColor].CGColor;
    self.layer.borderWidth=1.2f;
    
    self.backgroundColor=[UIColor whiteColor];
    
    self.imgV.layer.borderColor=[UIColor blackColor].CGColor;
    self.imgV.layer.borderWidth=1.0f;
    
}



-(void)setHotItem:(HotItem *)hotItem{
    _hotItem=hotItem;
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",YGBaseURL,_hotItem.pic]];
    UIImage *placeHolderImg=[UIImage imageNamed:@"art"];
    [self.imgV sd_setImageWithURL:url placeholderImage:placeHolderImg];
    
    
}


@end
