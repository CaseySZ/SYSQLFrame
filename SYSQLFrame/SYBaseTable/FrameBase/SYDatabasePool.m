//
//  SYDatabasePool.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "SYDatabasePool.h"
#import "SYDataBase.h"

@interface SYDatabasePool ()

@property (nonatomic,strong)NSMutableDictionary *dbPoolInfo;

@end

@implementation SYDatabasePool

static SYDatabasePool *__syDataBasePool;
+ (SYDatabasePool*)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __syDataBasePool = [SYDatabasePool new];
    });
    
    return __syDataBasePool;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        _dbPoolInfo = [NSMutableDictionary new];
    }
    return self;
}


- (SYDataBase*)dataBaseWithName:(NSString*)dataBaseName{
    
    if([_dbPoolInfo objectForKey:dataBaseName]){
        
        return [_dbPoolInfo objectForKey:dataBaseName];
        
    }else{
        
        SYDataBase *dataBase = [[SYDataBase alloc] initWithDataBaseName:dataBaseName error:nil];
        
        [_dbPoolInfo setObject:dataBase forKey:dataBaseName];
        
        return dataBase;
    }
    
}

- (void)closeDataBase:(NSString*)dataBaseName{
    
    SYDataBase *dataBase = [_dbPoolInfo objectForKey:dataBaseName];
    if (dataBase) {
        // 关闭的方法
        [dataBase closeDatabase];
    }
    [_dbPoolInfo removeObjectForKey:dataBaseName];
}

- (void)closeAllDataBase{
    
    [_dbPoolInfo enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        SYDataBase *dataBase = obj;
        if ([dataBase isKindOfClass:[SYDataBase class]]) {
            [dataBase closeDatabase];
        }
        
    }];
    
    [_dbPoolInfo removeAllObjects];
}
@end
