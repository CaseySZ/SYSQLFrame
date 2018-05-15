//
//  SYSQLCommandHandle+Delete.h
//  XPSPlatform
//
//  Created by sy on 2018/2/6.
//  Copyright © 2018年 EOC. All rights reserved.
//

#import "SYSQLCommandHandle.h"

@interface SYSQLCommandHandle (Delete)


- (void)preSqlDeleteAllRecordFromTable:(NSString*)tableName;

@end
