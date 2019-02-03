//
//  QLSubTieBaViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/6.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLSubTieBaViewController.h"
#import "QLTieBaCell.h"
#import "QLTieBaDetailViewController.h"
#import "QLTieBaNetWork.h"
#import "WTLoadFailEmpty.h"
#import <MJRefresh.h>
#import "QLMineNetWork.h"

@interface QLSubTieBaViewController ()
@property (nonatomic, assign) int pageIndex;
@property (nonatomic, assign) int totalPage;
@property (nonatomic,assign) BOOL isFromRefresh;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation QLSubTieBaViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc] init];
    self.navBar.hidden = YES;
    self.isFromRefresh = YES;
    self.formManager[@"QLTieBaItem"] = @"QLTieBaCell";
    self.formTable.top = 0;
    self.formTable.height = WTScreenHeight-WT_NavBar_Height-32-WT_TabBar_Height;
    
    self.formTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.pageIndex = 1;
        self.isFromRefresh = YES;
        [self getData];
    }];
    [WTLoadingView1 showLoadingInView:self.view top:self.formTable.top];
    self.pageIndex = 1;
    [self getData];
}

- (void)getData {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:[NSNumber numberWithInt:self.pageIndex] forKey:@"page"];
    [param setObject:@"10" forKey:@"pageSize"];
    [param setObject:self.catogeryInfo[@"plateId"] forKey:@"plateId"];
    [QLTieBaNetWork getTieBaList:nil successHandler:^(id json) {
        [self.formTable.mj_header endRefreshing];
        [WTLoadingView1 hideAllLoadingForView:self.view];
        
        self.totalPage = [[WTUtil strRelay:json[@"count"]] intValue];
        if (self.isFromRefresh) {
            [self.dataArray removeAllObjects];
        }
        NSArray *ar = json[@"subjectData"];
        if (ar && [ar isKindOfClass:[NSArray class]]) {
            [self.dataArray addObjectsFromArray:ar];
        }
        [self initForm];
        self.isFromRefresh = NO;
    } failHandler:^(NSString *message) {
        [self.formTable.mj_header endRefreshing];
        if (self.isFromRefresh) {
            [WTLoadFailView showFailInView:self.view top:self.formTable.top retryPress:^{
                [WTLoadingView1 showLoadingInView:self.view top:self.formTable.top];
                [self getData];
            }];
        }
        self.isFromRefresh = NO;
    }];
}

- (void)initForm {
    WT(weakSelf);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    for (int i = 0; i < self.dataArray.count; i++) {
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
        NSDictionary *dic = self.dataArray[i];
        
        QLTieBaItem *it = [[QLTieBaItem alloc] init];
        it.info = dic;
        it.selectionHandler = ^(QLTieBaItem *item) {
            QLTieBaDetailViewController *detail = [[QLTieBaDetailViewController alloc] init];
            detail.subjectId = item.info[@"subjectId"];
            [weakSelf.navigationController pushViewController:detail animated:YES];
        };
        it.guanzhuHandler = ^(id info) {
            [weakSelf guanZhu:info];
        };
        [section0 addItem:it];
    }
    [section0 addItem:[WTEmptyItem initWithHeight:8]];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

- (void)guanZhu:(id)info {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@"3" forKey:@"type"];
    [param setObject:[WTUtil strRelay:info[@"subjectId"]] forKey:@"objectId"];
    [QLMineNetWork guanZhuUser:param successHandler:^(id json) {
        [self.formTable.mj_header beginRefreshing];
    } failHandler:^(NSString *message) {
        [WTToast makeText:message];
    }];
}
@end
