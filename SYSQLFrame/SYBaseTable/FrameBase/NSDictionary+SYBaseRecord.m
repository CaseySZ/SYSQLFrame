//
//  NSDictionary+SYBaseRecord.m
//  XPSPlatform
//
//  Created by sy on 2018/2/5.
//  Copyright © 2018年 EOC. All rights reserved.
//

#import "NSDictionary+SYBaseRecord.h"
#import "SYBaseTable.h"

@implementation NSDictionary (SYBaseRecord)


- (NSDictionary*)dictMatchTableColumn:(id<SYBaseTableProtocol>)table{
    
    // 匹配表字段
    NSMutableDictionary *columnDict = [NSMutableDictionary dictionary];
    [table.columnValue enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([self objectForKey:key]) {
            [columnDict setObject:[self objectForKey:key] forKey:key];
        }else{
            [columnDict setObject:@"" forKey:key];
        }
        
    }];
    
    return columnDict;
}


@end
