//
//  ArtGalleryDetailHeader.m
//  BasicFramework
//
//  Created by 周航 on 16/11/3.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtGalleryDetailHeader.h"

@implementation ArtGalleryDetailHeader

+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
