//
//  HomePageSectionView.m
//  BasicFramework
//
//  Created by 周航 on 16/10/31.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HomePageSectionView.h"

@implementation HomePageSectionView
+(instancetype)view
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(void)setTitle:(NSString *)title{
    _title=title;
    self.titleLabel.text=_title;
    
}
@end
