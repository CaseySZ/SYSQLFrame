//
//  SYBaseTable+Read.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYBaseTable+Read.h"
#import "SYSQLCommandHandle.h"
#import "SYSQLCommandHandle+Read.h"
#import "SYBaseRecord.h"

@implementation SYBaseTable (Read)

- (NSArray*)getAllRecordFromTable{
    
    id <SYBaseTableProtocol> temSelf = (id <SYBaseTableProtocol>)self;
    
    SYSQLCommandHandle *sqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[temSelf dataBaseName]];
    
    // 准备  语句
    [sqlExcuteHandle preSqlReadRecordTableName:[temSelf tableName]];
    
    // 执行
    
    NSArray *tableRecordAry = [sqlExcuteHandle excuteReadSQLCommand];
    if (temSelf.recordClass) {
        
        NSMutableArray *baseRecorAry = [NSMutableArray new];
        for (int  i = 0; i < tableRecordAry.count; i++) {
            
            SYBaseRecord *recordClass = [[temSelf.recordClass alloc] init];
            
            NSDictionary *infoDict = tableRecordAry[i];
            [infoDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                
                [recordClass setRecordProValue:obj property:key];
            }];
            
            [baseRecorAry addObject:recordClass];
        }
        
        return baseRecorAry;
        
    }else{
        
        return tableRecordAry;
    }
    
}

- (NSArray*)getRecordWithLikeCondition:(NSString*)condition likeKey:(NSString*)likeKey{
    
    id <SYBaseTableProtocol> temSelf = (id <SYBaseTableProtocol>)self;
    
    if (![temSelf.columnValue objectForKey:likeKey]) {
        NSLog(@"likeKey:%@有问题", likeKey);
        return [NSArray array];
    }
    
    SYSQLCommandHandle *sqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[temSelf dataBaseName]];
    
    // 准备  语句
    [sqlExcuteHandle preSqlReadRecordTableName:[temSelf tableName] likeCondition:condition likeKey:likeKey];
    
    // 执行
    
    NSArray *tableRecordAry = [sqlExcuteHandle excuteReadSQLCommand];
    if (temSelf.recordClass) {
        
        NSMutableArray *baseRecorAry = [NSMutableArray new];
        for (int  i = 0; i < tableRecordAry.count; i++) {
            
            SYBaseRecord *recordClass = [[temSelf.recordClass alloc] init];
            
            NSDictionary *infoDict = tableRecordAry[i];
            [infoDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                
                [recordClass setRecordProValue:obj property:key];
            }];
            
            [baseRecorAry addObject:recordClass];
        }
        
        return baseRecorAry;
        
    }else{
        
        return tableRecordAry;
    }
}


- (NSArray *)selectRecordWithCustomCondition:(NSString*)condition{
    id <SYBaseTableProtocol> temSelf = (id <SYBaseTableProtocol>)self;
    
    SYSQLCommandHandle *sqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[temSelf dataBaseName]];
    
    // 准备  语句
    [sqlExcuteHandle preSqlReadRecordTableName:[temSelf tableName] customCondition:condition];
    
    // 执行
    
    NSArray *tableRecordAry = [sqlExcuteHandle excuteReadSQLCommand];
    if (temSelf.recordClass) {
        
        NSMutableArray *baseRecorAry = [NSMutableArray new];
        for (int  i = 0; i < tableRecordAry.count; i++) {
            
            SYBaseRecord *recordClass = [[temSelf.recordClass alloc] init];
            
            NSDictionary *infoDict = tableRecordAry[i];
            [infoDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                
                [recordClass setRecordProValue:obj property:key];
            }];
            
            [baseRecorAry addObject:recordClass];
        }
        
        return baseRecorAry;
        
    }else{
        
        return tableRecordAry;
    }
}
@end
