//
//  QLCareNetWorkingUtil.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/12.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLCareNetWorkingUtil : NSObject
//我的关注列表
+ (void)getFlowIndex:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
@end
