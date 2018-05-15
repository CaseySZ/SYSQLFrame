//
//  SYBaseSQLHandle+Insert.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//


#import "SYSQLCommandHandle.h"

@interface SYSQLCommandHandle (Insert)

// 返回array 是因为二进制数据需要后面来填充，返回的array数据在执行的时候填充
- (NSArray*)preSqlInsertContainBinary:(NSString*)tableName columnInfo:(NSDictionary*)columnInfo;

//preSqlInsertToTableName 没有处理二进制数据
- (void)preSqlInsertToTableName:(NSString*)tableName columnInfo:(NSDictionary*)columnInfo;

// 批量插入数据，不包括二进制处理
- (void)preSqlInsertToTableName:(NSString*)tableName columnArr:(NSArray*)columnArr;

@end
