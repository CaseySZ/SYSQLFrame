//
//  SYBaseSQLHandle+Insert.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//


#import "SYSQLCommandHandle.h"

@interface SYSQLCommandHandle (Insert)

- (NSArray*)preSqlInsertContainBinary:(NSString*)tableName columnInfo:(NSDictionary*)columnInfo;

//preSqlInsertToTableName 没有处理二进制数据
- (void)preSqlInsertToTableName:(NSString*)tableName columnInfo:(NSDictionary*)columnInfo;


@end
