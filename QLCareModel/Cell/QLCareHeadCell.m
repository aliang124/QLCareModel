//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLCareHeadCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"
#import "QLListPictureView.h"
#import "QLListDianZanCountView.h"
#import "QLMerchantView.h"
#import "UIView+LSCore.h"

@implementation QLCareHeadItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 330;
        self.descHeight = 0;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLCareHeadCell()
{
    UIButton *bgView;
    UIImageView *userIcon;
    UILabel *userNameLab;
    UILabel *dateLab;

    //第二行
    UILabel *tipLab;
}
@end

@implementation QLCareHeadCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = WT_Color_ViewBackGround;
    
    bgView = [[UIButton alloc] initWithFrame:CGRectMake(8, 0, WTScreenWidth-8-8, 330)];
    bgView.backgroundColor = [UIColor whiteColor];
    [bgView addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight withRadii:CGSizeMake(7, 7)];
    [self.contentView addSubview:bgView];
    
    //用户信息区域
    userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 28, 28)];
    userIcon.backgroundColor = [UIColor redColor];
    userIcon.layer.cornerRadius = 14;
    userIcon.layer.masksToBounds = YES;
    [bgView addSubview:userIcon];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(userIcon.right+6, 12, bgView.width-userIcon.right-6-110, 28)];
    userNameLab.font = WTFontSys(12);
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [bgView addSubview:userNameLab];
    
    dateLab = [[UILabel alloc] initWithFrame:CGRectMake(bgView.width-110, 12, 110-20, 28)];
    dateLab.font = WTFontSys(10);
    dateLab.textAlignment = NSTextAlignmentRight;
    dateLab.textColor = QL_DateTextColor_Gray;
    [bgView addSubview:dateLab];

    //第二行
    tipLab = [[UILabel alloc] initWithFrame:CGRectMake(12, userIcon.bottom+12, bgView.width-12-12, 9)];
    tipLab.font = WTFontSys(10);
    tipLab.textColor = QL_DescColor_Gray;
    [bgView addSubview:tipLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    userNameLab.text = @"用户A";
    dateLab.text = @"11月22日 12:22";
    [userIcon setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    //第二行
    tipLab.text = [WTUtil strRelay:self.item.tipText];
    bgView.height = tipLab.bottom+7;
    self.item.cellHeight = bgView.height;
}
@end
