//
//  TextTable.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 EOC. All rights reserved.
//

#import "TextTable.h"

@implementation TextTable


- (NSString*)tableName{
    
    return @"Test";
}

- (NSString*)dataBaseName{
    
    return @"testFile";
}

- (NSDictionary*)colomnValue{
    
    return @{
             
             @"idStr":@"char",
             @"name": @"char",
             @"phone": @"char",
             
             };
}

- (Class)recordClass{
    
    return nil;
}

@end
