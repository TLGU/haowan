//
//  ArtGalleryDetailHeader.h
//  BasicFramework
//
//  Created by 周航 on 16/11/3.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ArtGalleryDetailHeaderDelegate <NSObject>

-(void)backAction:(id)sender;

@end

@interface ArtGalleryDetailHeader : UIView
+(instancetype)header;
@property(weak,nonatomic)id<ArtGalleryDetailHeaderDelegate> delegate;
@end
