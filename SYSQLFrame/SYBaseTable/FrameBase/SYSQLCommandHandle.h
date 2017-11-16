//
//  SYBaseSQLHandle.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class SYDataBase;

@interface SYSQLCommandHandle : NSObject

@property (nonatomic, strong, readonly)NSString *databaseName;
@property (nonatomic, strong)NSMutableString *sqlCommand;

/*
 一个数据库文件一个sqlite3，不是一个对象对应一个sqlite3
 需要一个池子来保存 sqlite和文件的一一对应关系，并将sqlite对象化（即封装）
 */
//@property (nonatomic, assign)sqlite3 *sqlite3;
@property (nonatomic, strong)SYDataBase *dataBase; // 里面包含sqlite3*


- (instancetype)initWithDatabaseName:(NSString*)databaseName;

// 读语句
- (NSArray*)excuteReadSQLCommand;

// 写语句 值已经在SQL语句里面
- (BOOL)excuteWriteSQLCommand;

//写语句 值没在SQL语句里面
- (BOOL)excuteWriteSqlBinary:(NSArray*)valueAry;

@end
