//
//  SYBaseTable+Insert.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//


#import "SYBaseTable.h"

@protocol SYBaseRecordProtocol;

@interface SYBaseTable (Insert)


//
- (void)insertDataContainBinary:(id<SYBaseRecordProtocol>)record error:(NSError **)error;

- (void)insertDictionaryToTable:(NSDictionary*)infoDict error:(NSError **)error;

- (void)insertArrayToTable:(NSArray<NSDictionary*>*)infoArr error:(NSError **)error;

// insertData没有处理二进制数据
//- (void)insertData:(id<SYBaseRecordProtocol>)record error:(NSError **)error;

@end
