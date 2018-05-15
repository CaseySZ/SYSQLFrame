//
//  SYSQLCommandHandle+Delete.m
//  XPSPlatform
//
//  Created by sy on 2018/2/6.
//  Copyright © 2018年 EOC. All rights reserved.
//

#import "SYSQLCommandHandle+Delete.h"

@implementation SYSQLCommandHandle (Delete)

// delete from table where 1 = 1; 删除所有的
- (void)preSqlDeleteAllRecordFromTable:(NSString*)tableName{
    
    self.sqlCommand =  nil;
    self.sqlCommand = [NSMutableString string];
    [self.sqlCommand appendFormat:@"delete from %@ where 1 = 1", tableName];
    
}

@end
