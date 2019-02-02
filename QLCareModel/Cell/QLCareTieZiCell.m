//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLCareTieZiCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"
#import "QLListPictureView.h"
#import "QLListDianZanCountView.h"
#import "QLMerchantView.h"

@implementation QLCareTieZiItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 64;
        self.titleHeight = 5;
        self.tagWidth = 0;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLCareTieZiCell()
{
    UIButton *bgView;
    UIView *contentView;
    UILabel *titleLab;
    UILabel *tagLab;
    //点赞数量
    QLListDianZanCountView *zanView;
}
@end

@implementation QLCareTieZiCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = WT_Color_ViewBackGround;
    
    bgView = [[UIButton alloc] initWithFrame:CGRectMake(8, 0, WTScreenWidth-8-8, 64)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(12, 0, bgView.width-12-12, bgView.height)];
    contentView.backgroundColor = WTColorHex(0xFAFAF7);
    [bgView addSubview:contentView];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(7, 8, contentView.width-7-7, 12)];
    titleLab.font = WTFontSys(14);
    titleLab.numberOfLines = 0;
    titleLab.textColor = QL_UserName_TitleColor_Black;
    [contentView addSubview:titleLab];

    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(20, titleLab.bottom+19, 40, 14)];
    tagLab.font = WTFontSys(10);
    tagLab.textColor = QL_TagTextColor_Green;
    tagLab.backgroundColor = QL_TagColor_Green;
    tagLab.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:tagLab];

    //点赞数量区域
    zanView = [[QLListDianZanCountView alloc] initWithFrame:CGRectMake(0, titleLab.bottom+17, contentView.width, 10)];
    [contentView addSubview:zanView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    titleLab.text = @"爸妈做到这5点，宝宝将来不愁大长腿！";
    if (self.item.titleHeight==5) {
        [titleLab sizeToFit];
        self.item.titleHeight = titleLab.height;
    }
    titleLab.frame = CGRectMake(7, 8, contentView.width-7-7, self.item.titleHeight);

    tagLab.text = @"吃喝玩乐";
    if (self.item.tagWidth==0) {
        self.item.tagWidth=tagLab.width;
    }
    tagLab.frame = CGRectMake(20, titleLab.bottom+19, self.item.tagWidth+8, 14);
    zanView.frame = CGRectMake(0, titleLab.bottom+19, contentView.width, 10);
    
    contentView.height = tagLab.bottom+10;
    bgView.height = contentView.bottom;
    self.item.cellHeight = bgView.height;
}
@end
