//
//  HomePageSectionView.h
//  BasicFramework
//
//  Created by 周航 on 16/10/31.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageSectionView : UIView
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property(copy,nonatomic)NSString *title;
+(instancetype)view;


@end
