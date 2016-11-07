//
//  SectionHeaderNormal.h
//  BasicFramework
//
//  Created by 周航 on 16/11/7.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderNormal : UIView
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

+(instancetype)headerWithTitle:(NSString *)title;


@end
