//
//  ArtistCell.h
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Artist.h"

@protocol ArtistCellDelegate <NSObject>

-(void)touchHeaderAction:(id)sender;

@end

@interface ArtistCell : UICollectionViewCell
@property(strong,nonatomic)Artist *artist;


@property(weak,nonatomic)id<ArtistCellDelegate> delegate;


@end
