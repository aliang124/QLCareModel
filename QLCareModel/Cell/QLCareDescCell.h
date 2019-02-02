//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLCareDescItem : WTBaseItem
@property (nonatomic,assign) float titleHeight;
@property (nonatomic,copy) NSString *titleText;
@end

@interface QLCareDescCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLCareDescItem *item;
@end
