//
//  SYBaseSQLHandle+Read.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYSQLCommandHandle.h"

@interface SYSQLCommandHandle (Read)

- (void)preSqlReadRecordTableName:(NSString*)tableName;

// @"select *from tableName where likeKey like '%%condition%%'"
- (void)preSqlReadRecordTableName:(NSString*)tableName likeCondition:(NSString*)condition likeKey:(NSString*)likeKey;

// @"select *from tableName where [condition]
- (void)preSqlReadRecordTableName:(NSString*)tableName customCondition:(NSString*)condition;
@end
