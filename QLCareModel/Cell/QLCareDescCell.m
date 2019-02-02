//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLCareDescCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLCareDescItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 5;
        self.titleHeight = 5;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLCareDescCell()
{
    UIButton *bgView;
    UILabel *titleLab;
}
@end

@implementation QLCareDescCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = WT_Color_ViewBackGround;
    
    bgView = [[UIButton alloc] initWithFrame:CGRectMake(8, 0, WTScreenWidth-8-8, 64)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 8, bgView.width-12-21, 12)];
    titleLab.font = WTFontSys(12);
    titleLab.numberOfLines = 0;
    titleLab.textColor = QL_UserName_TitleColor_Black;
    [bgView addSubview:titleLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    titleLab.text = [WTUtil strRelay:self.item.titleText];
    if (self.item.titleHeight==5) {
        [titleLab sizeToFit];
        self.item.titleHeight = titleLab.height;
    }
    titleLab.frame = CGRectMake(12, 8, bgView.width-12-21, self.item.titleHeight);
    bgView.height = titleLab.bottom;
    self.item.cellHeight = bgView.height;
}
@end
