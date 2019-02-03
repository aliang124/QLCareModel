//
//  WTIconTextCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLFaTieTitleItem : WTBaseItem
@end

@interface QLFaTieTitleCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLFaTieTitleItem *item;
@end
