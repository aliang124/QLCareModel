//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLCareCornerCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIView+LSCore.h"

@implementation QLCareCornerItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 8;
    }
    return self;
}

@end

@interface QLCareCornerCell()
{
    UIButton *bgView;
}
@end

@implementation QLCareCornerCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = WT_Color_ViewBackGround;
    
    bgView = [[UIButton alloc] initWithFrame:CGRectMake(8, 0, WTScreenWidth-8-8, 8)];
    bgView.backgroundColor = [UIColor whiteColor];
    [bgView addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight withRadii:CGSizeMake(7, 7)];
    [self.contentView addSubview:bgView];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    bgView.height = self.item.cellHeight;
}
@end
