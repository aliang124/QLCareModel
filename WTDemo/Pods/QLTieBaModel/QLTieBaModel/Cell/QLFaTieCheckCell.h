//
//  WTIconTextCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLFaTieCheckItem : WTBaseItem
@property (nonatomic,assign) int checkType;//1公开 2匿名
@end

@interface QLFaTieCheckCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLFaTieCheckItem *item;
@end
