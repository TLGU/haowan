//
//  MeHeader.m
//  BasicFramework
//
//  Created by 周航 on 16/11/2.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "MeHeader.h"

@implementation MeHeader

+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
