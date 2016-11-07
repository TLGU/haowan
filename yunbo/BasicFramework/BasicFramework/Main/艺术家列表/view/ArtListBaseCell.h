//
//  ArtListBaseCell.h
//  BasicFramework
//
//  Created by 周航 on 16/10/30.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtListBaseCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *backImgV;
@property (strong, nonatomic) IBOutlet UIImageView *imgV;
@property (strong, nonatomic) IBOutlet UIView *baseBackView;

@property (strong, nonatomic) IBOutlet UITextView *textView;
@end
