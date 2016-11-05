//
//  Artist.h
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject
@property(copy,nonatomic)NSString *artistCard_id;
@property(copy,nonatomic)NSString *artist_id;
@property(strong,nonatomic)NSNumber * nice_count;
@property(copy,nonatomic)NSString * pic;
@property(copy,nonatomic)NSString * pic_back;
@property(copy,nonatomic)NSString *   picname;
@property(copy,nonatomic)NSString *    realname;
@property(strong,nonatomic)NSNumber *    shoucang_count;
@property(strong,nonatomic)NSNumber *    state;
@property(strong,nonatomic)NSNumber *    viewcount;
@end
