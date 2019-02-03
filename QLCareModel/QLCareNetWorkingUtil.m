//
//  QLCareNetWorkingUtil.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/12.
//  Copyright © 2019年 计恩良. All rights reserved.
//
//商家分类
#define QL_NetWorking_FollowIndex @"/follow/index"

#import "QLCareNetWorkingUtil.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLNetWorkingUtil.h"

@implementation QLCareNetWorkingUtil
+ (void)getFlowIndex:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_FollowIndex Param:info success:^(id json) {
        if (successHandler) {
            successHandler(json);
        }
    } fail:^(NSString *message) {
        if (failHandler) {
            failHandler(message);
        }
    }];
}

@end
