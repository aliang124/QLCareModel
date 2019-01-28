//
//  QLListPictureView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/28.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLListPictureView.h"

@implementation QLListPictureView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
@end
