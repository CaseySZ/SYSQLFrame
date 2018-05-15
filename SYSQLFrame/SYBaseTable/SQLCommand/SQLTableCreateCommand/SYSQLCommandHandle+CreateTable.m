//
//  SYBaseSQLHandle+CreateTable.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYSQLCommandHandle+CreateTable.h"

@implementation SYSQLCommandHandle (CreateTable)

// 准备 创建表SQL
//@"create table if not exists mySunY(id char, name char, iphone char)";
- (void)preSqlCreateTableName:(NSString*)tableName columnInfo:(NSDictionary*)columnInfo{
    
    self.sqlCommand =  nil;
    self.sqlCommand = [NSMutableString string];
    NSMutableArray *columnAry = [NSMutableArray new];
    
    [columnInfo enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *columnName = key;
        NSString *columnPro = obj;
        
        if (columnPro.length == 0 || columnName.length == 0) {
            // 日志异常
            NSLog(@"创建表时，表的字段有问题");
        }else{
            [columnAry addObject:[NSString stringWithFormat:@"%@ %@", columnName, columnPro]];
        }
        
    }];
    
    NSString *columnStr =  [columnAry componentsJoinedByString:@","];
    
    [self.sqlCommand appendFormat:@"create table if not exists %@ (%@)", tableName, columnStr];
    
}


@end
