//
//  QLMineHeadCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLFaTiePictureCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"
#import "UIButton+WebImage.h"
#import "WTImagePickerUtil.h"

@implementation QLFaTiePictureItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 100*QL_MULPITLE;
        self.hasBottomLine = NO;
        self.pictureArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end

@interface QLFaTiePictureCell()
{
    
}
@end

@implementation QLFaTiePictureCell

- (void)cellDidLoad
{
    [super cellDidLoad];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = [UIColor whiteColor];
    [self resetAllPictures];
}

- (void)resetAllPictures {
    [self.contentView removeAllSubviews];
    float offset = 16;
    for (int i = 0; i < self.item.pictureArray.count; i++) {
        UIImage *img = self.item.pictureArray[i];
        offset = 16+i*100+i*14;

        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMakes(offset, 0, 100, 100)];
        btn.backgroundColor = WTColorHex(0xFAFAF7);
        btn.layer.borderColor = WTColorHex(0xECECE6).CGColor;
        btn.layer.borderWidth = 1;
        [btn setImage:img forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
    }
    if (self.item.pictureArray.count<3) {
        offset = 16+self.item.pictureArray.count*114;
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMakes(offset, 0, 100, 100)];
        btn.backgroundColor = WTColorHex(0xFAFAF7);
        btn.layer.borderColor = WTColorHex(0xECECE6).CGColor;
        btn.layer.borderWidth = 1;
        [btn setImage:[UIImage imageNamed:@"camera_icon"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }
}

- (void)btnPress {
    [[WTImagePickerUtil shareInstance] showImagePicker:WTImagePickerUtilTypeActionMulti inViewController:self.item.weakController];
    [WTImagePickerUtil shareInstance].maxCount = 3;
    [[WTImagePickerUtil shareInstance] setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets) {
        if (photos.count>0) {
            [self.item.pictureArray addObjectsFromArray:photos];
            [self resetAllPictures];
        }
    }];
}

@end
