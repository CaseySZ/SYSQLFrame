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

@end
