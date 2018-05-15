//
//  SYBaseSQLHandle+Read.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYSQLCommandHandle.h"

@implementation SYSQLCommandHandle (Read)

- (void)preSqlReadRecordTableName:(NSString*)tableName{
    
    self.sqlCommand = nil;
    self.sqlCommand = [NSMutableString string];
    [self.sqlCommand appendFormat:@"select *from %@", tableName];
    
}

- (void)preSqlReadRecordTableName:(NSString*)tableName likeCondition:(NSString*)condition likeKey:(NSString*)likeKey{
    
    self.sqlCommand = nil;
    self.sqlCommand = [NSMutableString string];
    [self.sqlCommand appendFormat:@"select *from %@ where %@ like '%%%@%%'", tableName, likeKey, condition];
}

- (void)preSqlReadRecordTableName:(NSString*)tableName customCondition:(NSString*)condition{
    self.sqlCommand = nil;
    self.sqlCommand = [[NSMutableString alloc] initWithFormat:@"select * from %@ %@", tableName,condition];
    
}
@end
