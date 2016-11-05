//
//  Comment.h
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commenter : NSObject
@property(copy,nonatomic)NSString *comment_id;
@property(strong,nonatomic)NSNumber *nice_count;
@property(copy,nonatomic)NSString *pub_id;
@property(strong,nonatomic)NSNumber *shoucang_count;
@property(copy,nonatomic)NSString *showTime;
@property(strong,nonatomic)NSNumber *state;
@property(copy,nonatomic)NSString *userId ;
@property(copy,nonatomic)NSString *user_show_name;
@property(strong,nonatomic)NSNumber *viewcount;
@end
