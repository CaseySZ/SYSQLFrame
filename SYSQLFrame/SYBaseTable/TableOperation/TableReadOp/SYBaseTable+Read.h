//
//  SYBaseTable+Read.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYBaseTable.h"

@interface SYBaseTable (Read)

// 读操作 读记录
- (NSArray*)getAllRecordFromTable;


- (NSArray*)getRecordWithLikeCondition:(NSString*)condition likeKey:(NSString*)likeKey;

//
- (NSArray *)selectRecordWithCustomCondition:(NSString*)condition;
@end
