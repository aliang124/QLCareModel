//
//  QLFaTieMerchantCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLFaTieMerchantCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLFaTieMerchantItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 48;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLFaTieMerchantCell()
{
    UITextField *valueTextField;
}
@end

@implementation QLFaTieMerchantCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(15, 0, WTScreenWidth-15-17, 48)];
    [btn setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    btn.layer.cornerRadius = 2;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
    UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(17, 0, 55, btn.height)];
    tipLab.font = WTFontSys(12);
    tipLab.textColor = QL_UserName_TitleColor_Black;
    tipLab.text = @"主题商家";
    [btn addSubview:tipLab];
    
    UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(btn.width-7-15, 19, 7, 10)];
    [arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
    [btn addSubview:arrowImg];

    valueTextField = [[UITextField alloc] initWithFrame:CGRectMake(tipLab.right, 0, btn.width-tipLab.right-17-19, btn.height)];
    valueTextField.font = WTFontSys(12);
    valueTextField.textColor = QL_UserName_TitleColor_Black;
    valueTextField.placeholder = @"请选择";
    valueTextField.textAlignment = NSTextAlignmentRight;
    valueTextField.userInteractionEnabled = NO;
    [btn addSubview:valueTextField];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)btnPress {
    if (self.item.checkMerchantHandler) {
        self.item.checkMerchantHandler();
    }
}
@end
