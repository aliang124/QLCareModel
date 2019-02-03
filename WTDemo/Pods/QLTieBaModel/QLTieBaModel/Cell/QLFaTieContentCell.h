//
//  WTIconTextCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLFaTieContentItem : WTBaseItem
@end

@interface QLFaTieContentCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLFaTieContentItem *item;
@end
