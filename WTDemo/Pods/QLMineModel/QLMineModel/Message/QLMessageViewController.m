//
//  QLMessageViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLMessageViewController.h"
#import "QLSiXinViewController.h"
#import "QLDianPingViewController.h"
#import "QLHuiTieViewController.h"
#import "QLTongZhiViewController.h"

@interface QLMessageViewController ()<WTTabPagerControllerDataSource,WTTabPagerControllerDelegate>
@property (nonatomic, strong) NSArray *datas;

@end

@implementation QLMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [NSArray arrayWithObjects:@"私信",@"点评",@"回帖",@"通知", nil];
    [self setControllerTitle];
    [self setTabBarView];
    [self reloadData];
}

- (void)setControllerTitle {
    self.navBar.title = @"消息";
}

- (void)setTabBarView {
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.progressView.backgroundColor = QL_NavBar_BgColor_Yellow;
    self.tabBarHeight = 44;
    self.tabBar.layout.cellWidth = CGRectGetWidth(self.view.frame)/4;
    self.tabBar.layout.normalTextFont = [UIFont systemFontOfSize:14];
    self.tabBar.layout.selectedTextFont = [UIFont boldSystemFontOfSize:16];
    self.tabBar.layout.selectedTextColor = QL_NavBar_TitleColor_Black;
    self.tabBarOrignY = self.navBar.statusBarHeight + self.navBar.navBarTitleHeight;
    self.tabBar.layout.barStyle = WTPagerBarStyleProgressView;
    self.tabBar.layout.cellSpacing = 0;
    self.tabBar.layout.cellEdging = 0;
    self.tabBar.layout.adjustContentCellsCenter = YES;
    self.dataSource = self;
    self.delegate = self;
    self.pagerController.view.frame = CGRectMake(0, 0, WTScreenWidth, WTScreenHeight - self.tabBarOrignY - self.tabBarHeight);
}

#pragma mark - WTTabPagerControllerDataSource
- (NSInteger)numberOfControllersInTabPagerController {
    return _datas.count;
}

- (UIViewController *)tabPagerController:(WTTabPagerController *)tabPagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    if (index==0) {
        QLSiXinViewController *vc = [[QLSiXinViewController alloc] init];
        return vc;
    }
    if (index==1) {
        QLDianPingViewController *vc = [[QLDianPingViewController alloc] init];
        return vc;
    }
    if (index==2) {
        QLHuiTieViewController *vc = [[QLHuiTieViewController alloc] init];
        return vc;
    }
    if (index==3) {
        QLTongZhiViewController *vc = [[QLTongZhiViewController alloc] init];
        return vc;
    }
    UIViewController *VC = [[UIViewController alloc]init];
    return VC;
}

- (NSString *)tabPagerController:(WTTabPagerController *)tabPagerController titleForIndex:(NSInteger)index {
    NSString *title = _datas[index];
    return title;
}

@end
