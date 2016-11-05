//
//  Production.m
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "Production.h"

@implementation Production
+(NSDictionary *)mj_objectClassInArray{
    return @{
             @"comment_list":@"Commenter",
             @"user_see_jsonArray":@"Artist"
            };
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
                @"ID":@"id"
             };
}
@end
