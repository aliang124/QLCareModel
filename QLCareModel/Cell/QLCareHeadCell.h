//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLCareHeadItem : WTBaseItem
@property (nonatomic,copy) NSString *tipText;
@property (nonatomic,assign) float descHeight;
@end

@interface QLCareHeadCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLCareHeadItem *item;
@end
