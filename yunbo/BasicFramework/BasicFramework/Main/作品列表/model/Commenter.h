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
@property(copy,nonatomic)NSString *user_logo;

@property(copy,nonatomic)NSString *content;
//
//"comment_id" = 581d450ed6c45931f379159c;
//"nice_count" = 0;
//"pub_id" = 58159b01d6c4596dd06bf7f9;
//"shoucang_count" = 0;
//showTime = "2016-11-05 10:33:50";
//state = 1;
//userId = 58159e36d6c4596dd06bf7fc;
//"user_logo" = "attachFiles/20161030/58159e36d6c4596dd06bf7fc/581b0ff4d6c45928b21ca809";
//"user_show_name" = "\U6f58\U5929\U5bff";
//viewcount = 0;
@end
