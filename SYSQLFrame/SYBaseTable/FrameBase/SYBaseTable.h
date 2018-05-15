//
//  SYBaseTable.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SYBaseTableProtocol <NSObject>

@required

// 文件名
- (NSString*)dataBaseName;

// 表名
- (NSString*)tableName;

// 表结构
- (NSDictionary*)columnValue;

// 用于读数据， 数据类型Class，如果是nil，那么就是dict
- (Class)recordClass;

@end


@interface SYBaseTable : NSObject

- (NSString*)tableFilePath;

@end
