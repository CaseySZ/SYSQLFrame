//
//  NSDictionary+SYBaseRecord.h
//  XPSPlatform
//
//  Created by sy on 2018/2/5.
//  Copyright © 2018年 EOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SYBaseTableProtocol;

@interface NSDictionary (SYBaseRecord)


// 字典筛选出 表字段相同key的Dictionary
- (NSDictionary*)dictMatchTableColumn:(id<SYBaseTableProtocol>)table;

@end
