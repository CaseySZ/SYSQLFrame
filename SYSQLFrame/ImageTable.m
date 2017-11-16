//
//  ImageTable.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 EOC. All rights reserved.
//

#import "ImageTable.h"

@implementation ImageTable

- (NSString*)tableName{
    
    return @"image";
}

- (NSString*)dataBaseName{
    
    return @"imageFile";
}

- (NSDictionary*)colomnValue{
    
    return @{
             
             @"id":@"char",
             @"image": @"blob",
             
             };
}

- (Class)recordClass{
    
    return nil;
}

@end
