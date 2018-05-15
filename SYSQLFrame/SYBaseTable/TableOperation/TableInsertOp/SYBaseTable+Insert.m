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
#import "NSDictionary+SYBaseRecord.h"


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

- (void)insertDictionaryToTable:(NSDictionary*)infoDict error:(NSError **)error{
    
    id <SYBaseTableProtocol> temSelf = (id <SYBaseTableProtocol>)self;
    
    NSDictionary *columnDict = [infoDict dictMatchTableColumn:(id <SYBaseTableProtocol>)self];
    
    SYSQLCommandHandle *sqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[temSelf dataBaseName]];
    // 准备 语句
    NSArray *valueAry = [sqlExcuteHandle preSqlInsertContainBinary:[temSelf tableName] columnInfo:columnDict];
    // 执行
    [sqlExcuteHandle excuteWriteSqlBinary:valueAry];
    
}

- (void)insertArrayToTable:(NSArray<NSDictionary*>*)infoArr error:(NSError **)error{
    
    id <SYBaseTableProtocol> temSelf = (id <SYBaseTableProtocol>)self;
    
    NSMutableArray *columnArr = [NSMutableArray array];
    for (int i = 0; i < infoArr.count; i++) {
        NSDictionary *infoDict = infoArr[i];
        NSDictionary *columnDict = [infoDict dictMatchTableColumn:(id <SYBaseTableProtocol>)self];
        [columnArr addObject:columnDict];
    }
    
    SYSQLCommandHandle *sqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[temSelf dataBaseName]];
    // 准备 语句
    [sqlExcuteHandle preSqlInsertToTableName:[temSelf tableName] columnArr:columnArr];
    
    // 执行 
    [sqlExcuteHandle excuteWriteSQLCommand];
}


@end
