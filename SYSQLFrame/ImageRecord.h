//
//  ImageRecord.h
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 EOC. All rights reserved.
//

#import "SYBaseRecord.h"

@interface ImageRecord : SYBaseRecord

@property (nonatomic, strong)NSString *id;
@property (nonatomic, strong)NSData *image;

@end
