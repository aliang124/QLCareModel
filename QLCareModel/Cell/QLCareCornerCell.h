//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLCareCornerItem : WTBaseItem
@end

@interface QLCareCornerCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLCareCornerItem *item;
@end
