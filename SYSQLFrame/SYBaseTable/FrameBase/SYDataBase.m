//
//  SYDataBase.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYDataBase.h"

@implementation SYDataBase

- (instancetype)initWithDataBaseName:(NSString*)dataBaseName error:(NSError**)error{
    
    self = [super init];
    
    if (self) {
        
        _dataBaseName = dataBaseName;
        _dataBaseFilePath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"SYSqlDoc"];
        _dataBaseFilePath = [_dataBaseFilePath stringByAppendingPathComponent:dataBaseName];
        // 判断文件夹是否存在
        NSString *checkDocumentPath = [_dataBaseFilePath stringByDeletingLastPathComponent];
        NSFileManager *defaultFileManager = [NSFileManager defaultManager];
        if (![defaultFileManager fileExistsAtPath:checkDocumentPath]){
            [defaultFileManager createDirectoryAtPath:checkDocumentPath withIntermediateDirectories:YES attributes:nil error:nil];
            
        }
        const char *fileName = [_dataBaseFilePath UTF8String];
        int status = sqlite3_open_v2(fileName, &_dataBaseSql, SQLITE_OPEN_CREATE|SQLITE_OPEN_READWRITE| SQLITE_OPEN_FULLMUTEX, NULL);
        
        if (status != SQLITE_OK) {
            
            NSString *sqlErrorStr = [NSString stringWithUTF8String:sqlite3_errmsg(_dataBaseSql)];
            *error = [NSError errorWithDomain:@"Sql_Open_Error" code:100 userInfo:@{@"ErrorInfo":sqlErrorStr}];
            [self closeDatabase];
            return nil;
        }
    }
    
    
    return self;
}

- (void)closeDatabase{
    
    sqlite3_close_v2(_dataBaseSql);
    _dataBaseSql = nil;
    _dataBaseFilePath = nil;
    
}


@end
