//
//  ArtistHeaderView.m
//  BasicFramework
//
//  Created by 周航 on 16/11/7.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtistHeaderView.h"

@implementation ArtistHeaderView
+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
    
}

- (IBAction)backAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(backAction:)]) {
        [self.delegate backAction:sender];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
