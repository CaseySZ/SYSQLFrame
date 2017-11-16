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

@end
