//
//  SYBaseSQLHandle+CreateTable.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYSQLCommandHandle.h"

@interface SYSQLCommandHandle (CreateTable)

// 准备 创建表SQL
- (void)preSqlCreateTableName:(NSString*)tableName columnInfo:(NSDictionary*)columnInfo;

@end
