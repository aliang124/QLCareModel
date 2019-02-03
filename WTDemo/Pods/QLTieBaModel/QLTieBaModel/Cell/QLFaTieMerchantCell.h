//
//  QLFaTieMerchantCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLFaTieMerchantItem : WTBaseItem
@property (copy, readwrite, nonatomic) void (^checkMerchantHandler)(void);
@end

@interface QLFaTieMerchantCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLFaTieMerchantItem *item;
@end
