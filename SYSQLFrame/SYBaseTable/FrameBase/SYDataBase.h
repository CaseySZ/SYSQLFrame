//
//  SYDataBase.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


#define SQLDocumentName @"SYSqlDoc"

@interface SYDataBase : NSObject

@property (nonatomic, strong, readonly)NSString *dataBaseName;
@property (nonatomic, strong, readonly)NSString *dataBaseFilePath;
@property (nonatomic, assign, readonly)sqlite3 *dataBaseSql;


- (instancetype)initWithDataBaseName:(NSString*)dataBaseName error:(NSError**)error;

- (void)closeDatabase;

@end
