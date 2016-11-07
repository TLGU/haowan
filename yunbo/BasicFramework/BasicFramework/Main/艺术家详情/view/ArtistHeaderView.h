//
//  ArtistHeaderView.h
//  BasicFramework
//
//  Created by 周航 on 16/11/7.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ArtistHeaderViewDelegate <NSObject>

-(void)backAction:(id)sender;

@end


@interface ArtistHeaderView : UIView
+(instancetype)header;

@property(weak,nonatomic)id<ArtistHeaderViewDelegate> delegate;





@end
