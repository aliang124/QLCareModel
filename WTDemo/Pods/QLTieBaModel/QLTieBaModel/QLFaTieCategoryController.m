//
//  QLFaTieCategoryController.m
//  WTDemo
//
//  Created by 计恩良 on 2019/2/2.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLFaTieCategoryController.h"
#import "UIImageView+WebImage.h"
#import "QLFaTieViewController.h"

@implementation QLFaTieCategoryController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"发帖";
    
    UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(20, WT_NavBar_Height+16, WTScreenWidth-20, 11)];
    tipLab.font = WTFontSys(12);
    tipLab.textColor = QL_UserName_TitleColor_Black;
    tipLab.text = @"请选择话题分类";
    [self.view addSubview:tipLab];
    
    float width = 68;
    float top = tipLab.bottom+50;
    float offsetX = 30;
    float jianGe = (WTScreenWidth-30-30-68-68-68)/2;
    float heightOff = 49;
    for (int i = 0; i < self.catogeryList.count; i++) {
        NSDictionary *dic = self.catogeryList[i];
        
        int xxx = i%3;
        int yyy = i/3;
        
        offsetX = 30+(xxx*68)+(xxx*jianGe);
        top = (tipLab.bottom+50)+(yyy*68)+(yyy*heightOff);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(offsetX, top, width, width)];
        btn.layer.cornerRadius = width/2;
        btn.layer.masksToBounds = YES;
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:[WTUtil strRelay:dic[@"name"]] forState:UIControlStateNormal];
        btn.titleLabel.font = WTFontSys(12);
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)btnPress:(UIButton *)btn {
    int index = ((int)btn.tag) - 100;
    NSDictionary *dic = self.catogeryList[index];
    
    QLFaTieViewController *vc = [[QLFaTieViewController alloc] init];
    vc.categoryInfo = dic;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
