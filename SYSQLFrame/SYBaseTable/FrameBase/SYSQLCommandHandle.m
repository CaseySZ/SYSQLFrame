//
//  SYBaseSQLHandle.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYSQLCommandHandle.h"
#import "SYDatabasePool.h"
#import "SYDataBase.h"

@implementation SYSQLCommandHandle



- (instancetype)initWithDatabaseName:(NSString*)databaseName{
    
    self = [super init];
    if (self) {
        _databaseName = databaseName;
    }
    return self;
}

// 读SQL
- (NSArray*)excuteReadSQLCommand{
    
    NSMutableArray *backArry = [NSMutableArray array];
    sqlite3_stmt *stmt;
    int status = sqlite3_prepare_v2(self.dataBase.dataBaseSql, [self.sqlCommand UTF8String], -1, &stmt, 0);
    if(status != SQLITE_OK){
        NSLog(@"sqlite3_prepare_v2 fail");
        sqlite3_finalize(stmt);
        return backArry;
    }
    
    // 执行一次每返回一条记录
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        
        int colums = sqlite3_column_count(stmt);
        NSMutableDictionary *simpleRecordDict = [NSMutableDictionary new];
        for (int i = 0; i < colums; i++) {
            
            const char* columnName = sqlite3_column_name(stmt, i);
            NSString *columnKey = [NSString stringWithCString:columnName encoding:NSUTF8StringEncoding];
            
            int type = sqlite3_column_type(stmt,i);
            if (type == SQLITE_TEXT) {
                
                NSString *valueStr = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, i)];
                [simpleRecordDict setObject:valueStr forKey:columnKey];
                
            }else if(type == SQLITE_BLOB){
                
                int bytes = sqlite3_column_bytes(stmt, i);
                Byte * value = (Byte*)sqlite3_column_blob(stmt, i);
                if (bytes !=0 && value != NULL){
                    NSData * data = [NSData dataWithBytes:value length:bytes];
                    [simpleRecordDict setObject:data forKey:columnKey];
                }else{
                    [simpleRecordDict setObject:[NSData data] forKey:columnKey];
                }
                
            }else{
                // 其他数据类型没处理
            }
            
        }
        [backArry addObject:simpleRecordDict];
    }
    sqlite3_finalize(stmt);
    return backArry;
}


// 写SQL, 值直接写入sql语句
- (BOOL)excuteWriteSQLCommand{
    
    sqlite3_stmt *stmt; // 指令
    
    int status = sqlite3_prepare_v2(self.dataBase.dataBaseSql, [self.sqlCommand UTF8String], -1, &stmt, 0);
    if(status != SQLITE_OK){
        
        NSLog(@"sqlite3_prepare_v2 fail");
        sqlite3_finalize(stmt);
        return NO;
    }
    
    status = sqlite3_step(stmt);
    if (status != SQLITE_DONE) {
        NSLog(@"sqlite3_step fail");
        sqlite3_finalize(stmt);
        return NO;
    }
    
    sqlite3_finalize(stmt);
    
    return YES;
}

// 写SQL, 值不写入sql语句
// "insert into test_table(name,image) values(?,?)"
- (BOOL)excuteWriteSqlBinary:(NSArray*)valueAry{
    
    sqlite3_stmt * stmt;
    int status = sqlite3_prepare_v2(self.dataBase.dataBaseSql, [self.sqlCommand UTF8String], -1, &stmt, NULL);
    if(status != SQLITE_OK){
        
        NSLog(@"sqlite3_prepare_v2 fail");
        sqlite3_finalize(stmt);
        return NO;
    }
    
    for (int i = 0; i < valueAry.count; i++) {
        
        NSObject *value = valueAry[i];
        if ([value isKindOfClass:[NSData class]]) {
            NSData *valueData = (NSData*)value;
            sqlite3_bind_blob(stmt, i+1, [valueData bytes], (int)[valueData length], NULL);
        }else {
            NSString *valueStr = [value description];
            sqlite3_bind_text(stmt, i+1, [valueStr UTF8String], -1, NULL);
        }
    }
    
    status = sqlite3_step(stmt);
    if (status != SQLITE_DONE) {
        NSLog(@"写入数据 sqlite3_step fail");
        sqlite3_finalize(stmt);
        return NO;
    }
    sqlite3_finalize(stmt);
    
    return YES;
}


- (SYDataBase*)dataBase{
    
    if (!_dataBase) {
        _dataBase = [[SYDatabasePool shareInstance] dataBaseWithName:_databaseName];
    }
    return _dataBase;
    
}

@end
