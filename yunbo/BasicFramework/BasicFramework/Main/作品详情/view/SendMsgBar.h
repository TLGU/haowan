//
//  SendMsgBar.h
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SendMsgBarDelegate <NSObject>

-(void)sendMsg:(NSString *)msg sender:(id)sender;

@end

@interface SendMsgBar : UIView
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;
+(instancetype)bar;
@property(weak,nonatomic)id<SendMsgBarDelegate> delegate;
@end
