//
//  SYBaseTable+Delete.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYBaseTable+Delete.h"
#import "SYSQLCommandHandle.h"
#import "SYSQLCommandHandle+Delete.h"

@implementation SYBaseTable (Delete)


- (void)deleteAllTableRecord{
    
    id <SYBaseTableProtocol> temSelf = (id <SYBaseTableProtocol>)self;
    
    SYSQLCommandHandle *sqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[temSelf dataBaseName]];
    // 准备 语句
    [sqlExcuteHandle preSqlDeleteAllRecordFromTable:[temSelf tableName]];
    // 执行
    [sqlExcuteHandle excuteWriteSQLCommand];
    
}


@end
