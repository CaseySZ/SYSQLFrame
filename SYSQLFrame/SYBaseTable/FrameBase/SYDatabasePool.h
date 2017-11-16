//
//  SYDatabasePool.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SYDataBase;

@interface SYDatabasePool : NSObject


+ (SYDatabasePool*)shareInstance;

- (SYDataBase*)dataBaseWithName:(NSString*)dataBaseName;

- (void)closeDataBase:(NSString*)dataBaseName;

- (void)closeAllDataBase;


@end
