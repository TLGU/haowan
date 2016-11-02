//
//  HomeHeaderView.m
//  BasicFramework
//
//  Created by mr_right on 16/10/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HomeHeaderView.h"
#import "LBBanner.h"
#import "ArtisticVC.h"
#import "ArtListVC.h"
@interface HomeHeaderView ()<LBBannerDelegate>
@property (weak, nonatomic) IBOutlet UIView *right4View;
@property(strong,nonatomic)NSMutableArray * imageURLArray;

@property (strong, nonatomic) IBOutlet UIView *lanmuBackView;

@property(strong,nonatomic)LBBanner * banner;
@end

@implementation HomeHeaderView
+(instancetype)headerView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
-(NSMutableArray *)imageURLArray{
    if (!_imageURLArray) {
        _imageURLArray=[NSMutableArray array];
    }
    return _imageURLArray;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
          [self loadData:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
           
        });
    });
    
  
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData:) name:LoadHomePageNewData object:nil];
    
    
    
    
//    self.lanmuBackView.layer.borderColor=[UIColor grayColor].CGColor;
//    self.lanmuBackView.layer.borderWidth=0.5f;
    
    
}









-(void)loadData:(id)sender{
    WeakSelf(weakSelf)
    
    NSMutableDictionary *params= [NSMutableDictionary dictionary];
    params[@"pubConlumnId"]=@"57fca5edef722c216b767c98";
    [[NetWorkManager sharedInstance] requestDataForPOSTWithURL:@"front/list_pub.do" parameters:params Controller:nil success:^(id responseObject) {
        NSArray *dicArr=  (NSArray *)responseObject[@"data"];
        if (dicArr.count) {
            [self.imageURLArray removeAllObjects];
        }
        for (NSDictionary * dict in dicArr)
        {
            NSString *pic=  dict[@"pic"];
            NSString *picUrl=[NSString stringWithFormat:@"%@%@",YGBaseURL,pic];
            
            
            [self.imageURLArray addObject:picUrl];
         
        }
        if (self.imageURLArray.count) {
            [weakSelf loadNetImageSystemPageControl];
            
        }
       
        
    } failure:^(NSError *error) {
        
    }];

    
    
    

    
    
    
}

/**
 *  加载网络图片、系统PageControl、不设置标题
 */

- (void)loadNetImageSystemPageControl
{
 
    if (!self.imageURLArray.count) {
        return;
    }
    LBBanner * banner = [[LBBanner alloc] initWithImageURLArray:self.imageURLArray andFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight*0.5*0.6)];
    self.banner=banner;
    banner.delegate = self;
    banner.pageTurnTime = 5.0;
    
    [self.adView addSubview:banner];
}

- (void)banner:(LBBanner *)banner didClickViewWithIndex:(NSInteger)index {
    NSLog(@"didClickViewWithIndex:%ld", index);
}

- (void)banner:(LBBanner *)banner didChangeViewWithIndex:(NSInteger)index {
    NSLog(@"didChangeViewWithIndex:%ld", index);
}


- (IBAction)lanMuAction:(UIButton *)sender {
    switch (sender.tag)
    {
            
        case 1:{
            UINavigationController *vc =[self getCurrentVC].childViewControllers[0];
            [vc pushViewController:[ArtListVC new] animated:YES];
        }break;
        case 2:{
            
        }break;
        case 3:{
            
        }break;
        case 4:{
            UINavigationController *vc =[self getCurrentVC].childViewControllers[0];
            [vc pushViewController:[ArtisticVC new] animated:YES];
        }
            
            break;
        default:break;
    }
}


@end
