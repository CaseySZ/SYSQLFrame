//
//  SYBaseRecord.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SYBaseTableProtocol;

@protocol SYBaseRecordProtocol <NSObject>

- (NSDictionary*)dictFromObjectProAndMatchTableColumn:(id<SYBaseTableProtocol>)table;

- (void)setRecordProValue:(id)propertyValue property:(NSString*)propertyName;

@end

@interface SYBaseRecord : NSObject<SYBaseRecordProtocol>

@end
