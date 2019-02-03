//
//  WTLoadFailView.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/18.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTLoadFailView.h"
#import "WTLoadingView.h"
#import "WTLoadingView1.h"
#define WTColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface WTLoadFailView ()
@property (strong, nonatomic) IBOutlet UIButton *retryBtn;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) UIImageView *noLoginImg;
@property (strong, nonatomic) UILabel *noLoginLabel;
@property (strong, nonatomic) UIButton *noLoginBtn;

@end

@implementation WTLoadFailView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        int imgH = 39;
        int imgW = 39;
        int titleLabHeight = 50;
        self.isNoLogin = NO;
        
        float top = (frame.size.height-imgH-titleLabHeight)/2;
        float offsetX = (frame.size.width-imgW)/2;
        
        _retryBtn = [[UIButton alloc] initWithFrame:CGRectMake(offsetX, top, imgW, imgH)];
        [_retryBtn setImage:[UIImage imageNamed:@"WTLoading.bundle/comon_refresh_button"] forState:UIControlStateNormal];
        [_retryBtn addTarget:self action:@selector(retryBtnPress) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_retryBtn];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _retryBtn.frame.origin.y+_retryBtn.frame.size.height, frame.size.width, titleLabHeight)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"加载失败";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        
        _noLoginImg = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-80)/2, (frame.size.height-170)/2, 80, 80)];
        [_noLoginImg setImage:[UIImage imageNamed:@"emptyImage"]];
        [self addSubview:_noLoginImg];
        
        _noLoginLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _noLoginImg.frame.size.height+_noLoginImg.frame.origin.y+15, self.frame.size.width, 15)];
        _noLoginLabel.font = [UIFont systemFontOfSize:14];
        _noLoginLabel.textAlignment = NSTextAlignmentCenter;
        _noLoginLabel.text = @"快去登录查看关注动态吧~";
        [self addSubview:_noLoginLabel];
        
        _noLoginBtn = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width-160)/2, _noLoginLabel.frame.size.height+_noLoginLabel.frame.origin.y+15, 160, 38)];
        _noLoginBtn.layer.cornerRadius = 19;
        _noLoginBtn.layer.masksToBounds = YES;
        [_noLoginBtn setBackgroundImage:[self createImageFromColor:WTColorHex(0xF8DC3D)] forState:UIControlStateNormal];
        [_noLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_noLoginBtn setTitle:@"点击登录" forState:UIControlStateNormal];
        _noLoginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_noLoginBtn addTarget:self action:@selector(retryBtnPress) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_noLoginBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.retryBtn.hidden = NO;
    self.titleLabel.hidden = NO;
    self.noLoginBtn.hidden = YES;
    self.noLoginImg.hidden = YES;
    self.noLoginLabel.hidden = YES;
    if (self.isNoLogin) {
        self.retryBtn.hidden = YES;
        self.titleLabel.hidden = YES;
        self.noLoginBtn.hidden = NO;
        self.noLoginImg.hidden = NO;
        self.noLoginLabel.hidden = NO;
    }
}

- (void)retryBtnPress {
    self.hidden = YES;
    if (self.retryPress) {
        self.retryPress();
    }
}
#pragma mark - 便利方法
+ (void)showFailInView:(UIView *)view top:(float)top retryPress:(void (^)(void))retry
{
    //隐藏所有的加载中view
    [WTLoadingView hideAllLoadingForView:view];
    [WTLoadingView1 hideAllLoadingForView:view];
    //显示加载失败View
    WTLoadFailView *loadingView = [[WTLoadFailView alloc] initWithFrame:CGRectMake(0, top, view.frame.size.width, view.frame.size.height)];
    loadingView.retryPress = retry;
    [loadingView showInView:view];
}

+ (void)showNoLoginView:(UIView *)view top:(float)top retryPress:(void (^)(void))retry
{
    //隐藏所有的加载中view
    [WTLoadingView hideAllLoadingForView:view];
    [WTLoadingView1 hideAllLoadingForView:view];
    //显示加载失败View
    WTLoadFailView *loadingView = [[WTLoadFailView alloc] initWithFrame:CGRectMake(0, top, view.frame.size.width, view.frame.size.height)];
    loadingView.retryPress = retry;
    loadingView.isNoLogin = YES;
    [loadingView showInView:view];
}

+ (void)showFailInView:(UIView *)view retryPress:(void (^)(void))retry
{
    //隐藏所有的加载中view
    [WTLoadingView hideAllLoadingForView:view];
    [WTLoadingView1 hideAllLoadingForView:view];
    //显示加载失败View
    WTLoadFailView *loadingView = [[WTLoadFailView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    loadingView.retryPress = retry;
    [loadingView showInView:view];
}

+ (void)hideLoadingForView:(UIView *)view
{
    WTLoadFailView *loadingView = [self loadingForView:view];
    if (loadingView) {
        [loadingView hide];
    }
}

+ (void)hideAllFailForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            [(WTLoadFailView *)subview hideNoAnimation];
        }
    }
}

+ (WTLoadFailView *)loadingForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            return (WTLoadFailView *)subview;
        }
    }
    return nil;
}

#pragma mark - 实例方法

- (void)showInView:(UIView *)view
{
    if (!view) {
        return ;
    }
    if (self.superview != view) {
        [self removeFromSuperview];
        [view addSubview:self];
        [view bringSubviewToFront:self];
    }
}

- (void)hide
{
    self.alpha = 1.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self hideNoAnimation];
    }];
}

- (void)hideNoAnimation
{
    [self removeFromSuperview];
}

- (UIImage *)createImageFromColor:(UIColor *)color
{
    CGSize sz = CGSizeMake(1, 1);
    CGRect rect = CGRectMake(0, 0, sz.width,sz.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
