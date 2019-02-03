//
//  UIButton+WebImage.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "UIButton+WebImage.h"
#import "UIButton+YYWebImage.h"

@implementation UIButton (WebImage)
- (void)setWebBackGroundImageWithUrl:(NSString *)url placeHolder:(UIImage *)placeImg state:(UIControlState)state {
    [self yy_setBackgroundImageWithURL:[NSURL URLWithString:url] forState:state placeholder:placeImg];
}

- (void)setWebImageWithUrl:(NSString *)url placeHolder:(UIImage *)placeImg state:(UIControlState)state {
    [self yy_setImageWithURL:[NSURL URLWithString:url] forState:state placeholder:placeImg];
}
@end

