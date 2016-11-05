//
//  Production.h
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Artist;
@interface Production : NSObject
/*艺术家*/
@property(strong,nonatomic)Artist *artist;
/*chaodai*/
@property(copy,nonatomic)NSString *chaodai;
/*尺寸*/
@property(copy,nonatomic)NSString *cicun;
/*评论人列表*/
@property(strong,nonatomic)NSArray *comment_list;
/*文字内容*/
@property(copy,nonatomic)NSString *content;
/*ID*/
@property(copy,nonatomic)NSString *ID;
/*简介*/
@property(copy,nonatomic)NSString *intro;
/*作品名*/
@property(copy,nonatomic)NSString *name;
/*看好数量*/
@property(strong,nonatomic)NSNumber *nice_count;
/*作品地址*/
@property(copy,nonatomic)NSString *pic;
/*作品高度*/
@property(strong,nonatomic)NSNumber *pic_height;
/*作品宽度*/
@property(strong,nonatomic)NSNumber *pic_width;
/*售价*/
@property(strong,nonatomic)NSNumber *price_fen;

@property(copy,nonatomic)NSString *rootPubConlumnId;

@property(copy,nonatomic)NSString *rootPubConlumnName ;

@property(copy,nonatomic)NSString *secondPubConlumnId ;

@property(copy,nonatomic)NSString *secondPubConlumnName ;
/*收藏数*/
@property(strong,nonatomic)NSNumber *shoucang_count;
/*showTag_list*/
@property(copy,nonatomic)NSString *showTag_list;
/*时间*/
@property(copy,nonatomic)NSString *showTime ;
/*状态*/
@property(strong,nonatomic)NSNumber *state;

@property(copy,nonatomic)NSString *thirdPubConlumnId;

@property(copy,nonatomic)NSString *thirdPubConlumnName;

@property(strong,nonatomic)NSArray *user_see_jsonArray;

@property(strong,nonatomic)NSNumber *viewcount;
/*年代*/
@property(copy,nonatomic)NSString *years ;
/*作者*/
@property(copy,nonatomic)NSString *zuozhe;

@end
