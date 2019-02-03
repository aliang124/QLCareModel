//
//  WTIconTextCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLFaTiePictureItem : WTBaseItem
@property (nonatomic,strong) NSMutableArray *pictureArray;
@property (nonatomic,weak) UIViewController *weakController;
@end

@interface QLFaTiePictureCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLFaTiePictureItem *item;
@end
