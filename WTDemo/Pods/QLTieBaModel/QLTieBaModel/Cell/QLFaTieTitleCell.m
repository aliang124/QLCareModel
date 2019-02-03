//
//  QLMineHeadCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLFaTieTitleCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLFaTieTitleItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 47;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLFaTieTitleCell()
{
    UITextField *textField;
}
@end

@implementation QLFaTieTitleCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, WTScreenWidth-15-17, 47)];
    bgView.layer.cornerRadius = 3;
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderWidth = 0.5;
    bgView.backgroundColor = WTColorHex(0xECECE6);
    bgView.layer.borderColor = QL_Border_LineColor.CGColor;
    [self.contentView addSubview:bgView];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 0, bgView.width-15-12, 47)];
    textField.placeholder = @"标题（5-10字）";
    textField.textColor = QL_UserName_TitleColor_Black;
    textField.font = WTFontSys(14);
    [self.contentView addSubview:textField];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
