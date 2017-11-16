//
//  SYBaseTable.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYBaseTable.h"
#import "SYSQLCommandHandle.h"
#import "SYSQLCommandHandle+CreateTable.h"



@implementation SYBaseTable

// 初始化时 建表
- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        if ([self conformsToProtocol:@protocol(SYBaseTableProtocol)]) {
            
            id<SYBaseTableProtocol> tmpSelf = (id<SYBaseTableProtocol>)self;
            
            // sql语句对象
            SYSQLCommandHandle *sySqlExcuteHandle = [[SYSQLCommandHandle alloc] initWithDatabaseName:[tmpSelf dataBaseName]];
            
            // 准备sql语句
            [sySqlExcuteHandle preSqlCreateTableName:[tmpSelf tableName] columnInfo:[tmpSelf colomnValue]];
            
            // sql 执行语句
            [sySqlExcuteHandle excuteWriteSQLCommand];
            
        }else{
            
            NSException *exception = [NSException exceptionWithName:@"SYBaseTable error" reason:@"必须实现SYBaseTableProtocol" userInfo:nil];
            [exception raise];
        }
        
    }
    
    return self;
}


@end
