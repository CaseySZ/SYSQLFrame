//
//  SYBaseSQLHandle+Insert.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYBaseTable.h"
#import "SYBaseRecord.h"
#import "SYSQLCommandHandle+Insert.h"

@implementation SYSQLCommandHandle (Insert)


- (NSArray*)preSqlInsertContainBinary:(NSString*)tableName columnInfo:(NSDictionary*)columnInfo{
    
    self.sqlCommand = nil;
    self.sqlCommand = [NSMutableString string];
    
    NSArray *columnKeyAry =  [columnInfo allKeys];
    NSArray *valueAry = [columnInfo allValues];
    NSMutableArray *placeValue = [NSMutableArray new];
    for (int i = 0; i < valueAry.count; i++) {
        [placeValue addObject:@"?"];
    }
    NSString *keyStr = [columnKeyAry componentsJoinedByString:@","];;
    NSString *valueStr = [placeValue componentsJoinedByString:@","];;
    // insert into table(key1, key2) values ('1', 'SunY')
    [self.sqlCommand appendFormat:@"insert into %@ (%@) values (%@)", tableName, keyStr, valueStr];
    
    return valueAry;
    
}

- (void)preSqlInsertToTableName:(NSString*)tableName columnInfo:(NSDictionary*)columnInfo{
    
    self.sqlCommand = nil;
    self.sqlCommand = [NSMutableString string];
    NSMutableArray *columnKeyAry = [NSMutableArray new];
    NSMutableArray *valueAry  = [NSMutableArray new];
    [columnInfo enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *columnName = key;
        NSString *columnPro = obj;
        
        [columnKeyAry addObject:columnName];
        
        if (columnPro == nil || columnPro.length == 0) {
            // 日志异常
            [valueAry addObject:@"''"];
        }else{
            [valueAry addObject:[NSString stringWithFormat:@"'%@'", obj]];
        }
        
    }];
    
    NSString *keyStr = [columnKeyAry componentsJoinedByString:@","];;
    NSString *valueStr = [valueAry componentsJoinedByString:@","];;
    // insert into table(key1, key2) values ('1', 'SunY')
    [self.sqlCommand appendFormat:@"insert into %@ (%@) values (%@)", tableName, keyStr, valueStr];
    
}

// "insert into test_table(name,image) values(?,?)"


@end
