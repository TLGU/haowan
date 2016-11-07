//
//  ArtGalleryDetailVC.m
//  BasicFramework
//
//  Created by 周航 on 16/11/3.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtGalleryDetailVC.h"
#import "ArtGalleryDetailHeader.h"
#import "ArtGalleryDetailVCCell0.h"
#import "ArtGalleryDetailVCCell1.h"
@interface ArtGalleryDetailVC ()<UITableViewDelegate,UITableViewDataSource,ArtGalleryDetailHeaderDelegate>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)ArtGalleryDetailHeader *header;
@end

@implementation ArtGalleryDetailVC
static NSString *ArtGalleryDetailVCCell0ID=@"ArtGalleryDetailVCCell0ID";
static NSString *ArtGalleryDetailVCCell1ID=@"ArtGalleryDetailVCCell1ID";

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed=YES;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=NO;
}

-(ArtGalleryDetailHeader *)header{
    if (!_header) {
        _header=[ArtGalleryDetailHeader header];
        [_header setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3.0f)];
        _header.delegate=self;
    }
    return _header;
}
-(void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableHeaderView=self.header;
        [_tableView registerNib:[UINib nibWithNibName:@"ArtGalleryDetailVCCell0" bundle:nil] forCellReuseIdentifier:ArtGalleryDetailVCCell0ID];
        [_tableView registerNib:[UINib nibWithNibName:@"ArtGalleryDetailVCCell1" bundle:nil] forCellReuseIdentifier:ArtGalleryDetailVCCell1ID];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0)
    {
        ArtGalleryDetailVCCell0 *cell=[tableView dequeueReusableCellWithIdentifier:ArtGalleryDetailVCCell0ID forIndexPath:indexPath];
        return cell;
    }
    else{
        
        ArtGalleryDetailVCCell1 *cell=[tableView dequeueReusableCellWithIdentifier:ArtGalleryDetailVCCell1ID forIndexPath:indexPath];
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (kScreenHeight)/3.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

@end
