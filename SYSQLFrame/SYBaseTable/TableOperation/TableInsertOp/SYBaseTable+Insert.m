//
//  SYBaseTable+Insert.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYBaseTable.h"
#import "SYBaseTable+Insert.h"
#import "SYSQLCommandHandle+Insert.h"
#import "SYSQLCommandHandle.h"
#import "SYBaseRecord.h"



@implementation SYBaseTable (Insert)

- (void)insertData:(id<SYBaseRecordProtocol>)record error:(NSError **)error{
    
    id <SYBaseTableProtocol> temSelf = (id <SYBaseTableProtocol>)self;
    
    
    NSDictionary *columnDict = [record dictFromObjectProAndMatchTableColumn:temSelf];
    
    SYSQLCommandHandle *sqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[temSelf dataBaseName]];
    // 准备 语句
    [sqlExcuteHandle preSqlInsertToTableName:[temSelf tableName] columnInfo:columnDict];
    // 执行
    [sqlExcuteHandle excuteWriteSQLCommand];
    
}

- (void)insertDataContainBinary:(id<SYBaseRecordProtocol>)record error:(NSError **)error{
    
    id <SYBaseTableProtocol> temSelf = (id <SYBaseTableProtocol>)self;

    NSDictionary *columnDict = [record dictFromObjectProAndMatchTableColumn:temSelf];
    
    SYSQLCommandHandle *sqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[temSelf dataBaseName]];
    // 准备 语句
    NSArray *valueAry = [sqlExcuteHandle preSqlInsertContainBinary:[temSelf tableName] columnInfo:columnDict];
    // 执行
    [sqlExcuteHandle excuteWriteSqlBinary:valueAry];
    
}



@end
