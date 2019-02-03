//
//  QLFaTieViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2019/2/3.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLFaTieViewController.h"
#import "QLFaTieTitleCell.h"
#import "QLFaTieContentCell.h"
#import "QLFaTieCheckCell.h"
#import "QLFaTiePictureCell.h"
#import "QLFaTieMerchantCell.h"
#import "QLTieBaNetWork.h"

@interface QLFaTieViewController ()
@property (nonatomic,strong) QLFaTieTitleItem *itTitle;
@property (nonatomic,strong) QLFaTieContentItem *itContent;
@property (nonatomic,strong) QLFaTieCheckItem *itCheck;
@property (nonatomic,strong) QLFaTiePictureItem *itPicture;
@property (nonatomic,strong) QLFaTieMerchantItem *itMerchant;
@end

@implementation QLFaTieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = [NSString stringWithFormat:@"发帖-%@",[WTUtil strRelay:self.categoryInfo[@"name"]]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.formManager[@"QLFaTieTitleItem"] = @"QLFaTieTitleCell";
    self.formManager[@"QLFaTieContentItem"] = @"QLFaTieContentCell";
    self.formManager[@"QLFaTieCheckItem"] = @"QLFaTieCheckCell";
    self.formManager[@"QLFaTiePictureItem"] = @"QLFaTiePictureCell";
    self.formManager[@"QLFaTieMerchantItem"] = @"QLFaTieMerchantCell";

    [self initForm];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(8, WTScreenHeight-8-38-QL_SafeArea_BOTTOM, WTScreenWidth-8-8, 38)];
    [btn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    [btn setTitle:@"立即发布" forState:UIControlStateNormal];
    [btn setTitleColor:QL_NavBar_TitleColor_Black forState:UIControlStateNormal];
    btn.titleLabel.font = WTFontSys(14);
    [btn addTarget:self action:@selector(fabuBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)initForm {
    WT(weakSelf);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];

    [section0 addItem:[WTEmptyItem initWithHeight:16]];
    //输入标题
    self.itTitle = [[QLFaTieTitleItem alloc] init];
    [section0 addItem:self.itTitle];
    [section0 addItem:[WTEmptyItem initWithHeight:12]];
    //输入内容
    self.itContent = [[QLFaTieContentItem alloc] init];
    [section0 addItem:self.itContent];
    //是否匿名
    self.itCheck = [[QLFaTieCheckItem alloc] init];
    [section0 addItem:self.itCheck];
    //选择图片
    self.itPicture = [[QLFaTiePictureItem alloc] init];
    self.itPicture.weakController = self;
    [section0 addItem:_itPicture];
    //选择商家
    [section0 addItem:[WTEmptyItem initWithHeight:16]];
    self.itMerchant = [[QLFaTieMerchantItem alloc] init];
    [section0 addItem:self.itMerchant];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}

- (void)fabuBtnPress {
    [QLMBProgressHUDUtil showActivityMessageInWindow:@"正在发布"];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:[WTUtil strRelay:self.categoryInfo[@"plateId"]] forKey:@"plateId"];
    [param setObject:@"这个是测试发布的帖子" forKey:@"name"];
    [param setObject:@"这是一个测试帖子的内容这是一个测试帖子的内容这是一个测试帖子的内容这是一个测试帖子的内容这是一个测试帖子的内容这是一个测试帖子的内容这是一个测试帖子的内容这是一个测试帖子的内容" forKey:@"description"];
    
    NSMutableArray *attachment = [[NSMutableArray alloc] init];
    [attachment addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542593731&di=392abf890c5d3d1e8ae849cb0091500c&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F960a304e251f95cada6c0462c3177f3e6609524c.jpg",@"url",@"1",@"type", nil]];
    [attachment addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542593731&di=392abf890c5d3d1e8ae849cb0091500c&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F960a304e251f95cada6c0462c3177f3e6609524c.jpg",@"url",@"1",@"type", nil]];
    [attachment addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542593731&di=392abf890c5d3d1e8ae849cb0091500c&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F960a304e251f95cada6c0462c3177f3e6609524c.jpg",@"url",@"1",@"type", nil]];
    [param setObject:[WTJsonUtil jsonStringWithObject:attachment] forKey:@"attachment"];
    
    [QLTieBaNetWork confirmSubject:param successHandler:^(id json) {
        [QLMBProgressHUDUtil hideHUD];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failHandler:^(NSString *message) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:message];
    }];
}
@end
