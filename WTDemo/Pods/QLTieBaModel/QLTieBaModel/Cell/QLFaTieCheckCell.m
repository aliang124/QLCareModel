//
//  QLMineHeadCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLFaTieCheckCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLFaTieCheckItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 48;
        self.hasBottomLine = NO;
        self.checkType = 1;
    }
    return self;
}

@end

@interface QLFaTieCheckCell()
{
    
}
@property (nonatomic,strong) UIButton *btn1;
@property (nonatomic,strong) UIButton *btn2;
@end

@implementation QLFaTieCheckCell

- (void)cellDidLoad
{
    [super cellDidLoad];

    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(11, 12, 24, 24)];
    [self.btn1 setImage:[UIImage imageNamed:@"Radio_nocheck"] forState:UIControlStateNormal];
    [self.btn1 setImage:[UIImage imageNamed:@"Radio_checked"] forState:UIControlStateSelected];
    self.btn1.selected = YES;
    [self.btn1 addTarget:self action:@selector(btn1Press) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.btn1];
    
    UILabel *tipLab1 = [[UILabel alloc] initWithFrame:CGRectMake(self.btn1.right+6, 19, 40, 11)];
    tipLab1.font = WTFontSys(12);
    tipLab1.textColor = QL_DescColor_Gray;
    tipLab1.text = @"公开";
    [self.contentView addSubview:tipLab1];
    
    self.btn2 = [[UIButton alloc] initWithFrame:CGRectMake(76, 12, 24, 24)];
    [self.btn2 setImage:[UIImage imageNamed:@"Radio_nocheck"] forState:UIControlStateNormal];
    [self.btn2 setImage:[UIImage imageNamed:@"Radio_checked"] forState:UIControlStateSelected];
    [self.btn2 addTarget:self action:@selector(btn2Press) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.btn2];
    
    UILabel *tipLab2 = [[UILabel alloc] initWithFrame:CGRectMake(self.btn2.right+6, 19, 140, 11)];
    tipLab2.font = WTFontSys(12);
    tipLab2.textColor = QL_DescColor_Gray;
    tipLab2.text = @"匿名评价";
    [self.contentView addSubview:tipLab2];
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

- (void)btn1Press {
    self.btn1.selected = YES;
    self.btn2.selected = NO;
    self.item.checkType = 1;
}

- (void)btn2Press {
    self.btn1.selected = NO;
    self.btn2.selected = YES;
    self.item.checkType = 2;
}

@end
