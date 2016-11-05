//
//  SendMsgBar.m
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "SendMsgBar.h"

@implementation SendMsgBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)bar{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil ] lastObject];
    
    
    
    
}
-(void)awakeFromNib{

    [super awakeFromNib];
    
    
    self.sendBtn.layer.borderColor=[UIColor blackColor].CGColor;
    self.sendBtn.layer.borderWidth=1;
    
    [self.sendBtn setCornerRad:3];
    
    
}

@end
