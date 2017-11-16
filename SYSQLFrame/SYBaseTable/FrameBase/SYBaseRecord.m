//
//  SYBaseRecord.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYBaseRecord.h"
#import "SYBaseTable.h"
#import <objc/runtime.h>

@implementation SYBaseRecord

- (NSDictionary*)dictFromObjectProAndMatchTableColumn:(id<SYBaseTableProtocol>)table{
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    unsigned int count = 0;
    
    // 获取属性 数组
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        
        NSString *keyStr = [NSString stringWithUTF8String:property_getName(properties[i])];
        NSString *valueStr = [self valueForKey:keyStr];
        
        if (valueStr == nil) {
            [dict setObject:[NSNull null] forKey:keyStr];
        }else{
            [dict setObject:valueStr forKey:keyStr];
        }
        
    }
    free(properties);

    // 匹配表字段
    NSMutableDictionary *columnDict = [NSMutableDictionary dictionary];
    [table.colomnValue enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([dict objectForKey:key]) {
            [columnDict setObject:[dict objectForKey:key] forKey:key];
        }else{
            [columnDict setObject:@"" forKey:key];
        }
        
    }];
    
    return columnDict;
}

- (void)setRecordProValue:(id)propertyValue property:(NSString*)propertyName{
    
    if (!propertyName || propertyName.length == 0) {
        return;
    }
    
    NSString *setterSEL = [NSString stringWithFormat:@"set%@%@:", [[propertyName substringToIndex:1] capitalizedString], [propertyName substringFromIndex:1]];
    
    if([self respondsToSelector:NSSelectorFromString(setterSEL)]){
        
        // value异常没处理
        [self setValue:propertyValue forKey:propertyName];
        
    }else {
        
        NSLog(@"%@没有这个%@属性", NSStringFromClass([self class]), propertyName);
    }
    
}

@end
