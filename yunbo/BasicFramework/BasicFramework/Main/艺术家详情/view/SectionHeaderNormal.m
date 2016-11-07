//
//  SectionHeaderNormal.m
//  BasicFramework
//
//  Created by 周航 on 16/11/7.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "SectionHeaderNormal.h"

@implementation SectionHeaderNormal
+(instancetype)headerWithTitle:(NSString *)title{
    SectionHeaderNormal *header= [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
    
    header.titleLabel.text=title;
    return header;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
