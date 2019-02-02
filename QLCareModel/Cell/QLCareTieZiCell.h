//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLCareTieZiItem : WTBaseItem
@property (nonatomic,assign) float titleHeight;
@property (nonatomic,assign) float tagWidth;
@end

@interface QLCareTieZiCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLCareTieZiItem *item;
@end
