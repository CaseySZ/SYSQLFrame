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

// "insert into test_table(name,image) values(?,?)"  把值返回出去
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
    [self.sqlCommand appendFormat:@"insert into %@ (%@) values (%@)", tableName, keyStr, valueStr];
    
    return valueAry;
    
}

 // insert into table(key1, key2) values ('1', 'SunY')
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

// INSERT INTO 充值表 (字段1,字段2,字段3,...) VALUES (值1,值2,值3,...),(值1,值2,值3,...),(值1,值2,值3,...);
- (void)preSqlInsertToTableName:(NSString*)tableName columnArr:(NSArray*)columnArr{
    
    
    self.sqlCommand = nil;
    self.sqlCommand = [NSMutableString string];
    if (columnArr.count == 0) {
        return;
    }
    NSDictionary *columnKeyInfo = columnArr.firstObject;
    NSArray *columnKeyAry = columnKeyInfo.allKeys;
    NSString *keyStr = [columnKeyAry componentsJoinedByString:@","];
    
    NSMutableArray *columnValueAry  = [NSMutableArray new];
    
    for (NSInteger i = 0; i < columnArr.count; i++) {
        NSDictionary *columnInfo = columnArr[i];
        NSArray *valueArr = columnInfo.allValues;
        NSMutableArray *valueChangeArr = [NSMutableArray new];
        for (NSInteger j = 0; j < valueArr.count; j++) {
            [valueChangeArr addObject:[NSString stringWithFormat:@"'%@'", valueArr[j]]];
        }
        
        NSString *valueStr = [valueChangeArr componentsJoinedByString:@","];
        valueStr = [NSString stringWithFormat:@"(%@)", valueStr];
        [columnValueAry addObject:valueStr];
    }
    
    NSString *valueStr = [columnValueAry componentsJoinedByString:@","];
    
    [self.sqlCommand appendFormat:@"insert into %@ (%@) values %@", tableName, keyStr, valueStr];
    
}





@end
