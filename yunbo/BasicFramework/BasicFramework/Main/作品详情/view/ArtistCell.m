//
//  ArtistCell.m
//  BasicFramework
//
//  Created by 周航 on 16/11/5.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ArtistCell.h"

@interface ArtistCell ()
@property (strong, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ArtistCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    
    
    
    [self.btn setCornerRad:30];
    
    
    
    
    
    
}

- (IBAction)touchAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(touchHeaderAction:)]) {
        [self.delegate touchHeaderAction:self.artist];
    }
    
    
}

-(void)setArtist:(Artist *)artist{
    _artist=artist;
    NSString *url=  [NSString stringWithFormat:@"%@%@",YGBaseURL,_artist.picname];
    [self.btn sd_setBackgroundImageWithURL: [NSURL URLWithString:url] forState:UIControlStateNormal];
    
    
    
    
    
    
    
    
    
    
    
}
@end
