//
//  ViewController.m
//  SYSQLFrame
//
//  Created by sy on 2017/11/16.
//  Copyright © 2017年 SunY. All rights reserved.
//

#import "ViewController.h"
#import "SYBaseTable.h"
#import "TextTable.h"
#import "TestRecord.h"
#import "ImageTable.h"
#import "ImageRecord.h"

@interface ViewController (){
    
    TextTable *textTable;
    ImageTable *imageTable;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    imageTable = [ImageTable new];
    
   // [self imageTable];
    
}

- (void)imageTable{
    
    imageTable = [ImageTable new];
    
    ImageRecord *imageRecord = [ImageRecord new];
    imageRecord.id = @"1001";
    imageRecord.image = UIImageJPEGRepresentation([UIImage imageNamed:@"2.jpg"], 1);
    
    [imageTable insertDataContainBinary:imageRecord error:nil];
}

- (void)textTable{
    
    textTable = [TextTable new];
    
    TestRecord *testRecord = [[TestRecord alloc] init];
    testRecord.idStr = @"33";
    // testRecord.name = @"suny2";
    testRecord.phone = @"33333";
    
    [textTable insertDataContainBinary:testRecord error:nil];
    // [textTable insertData:testRecord error:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"%@", [imageTable getAllRecordFromTable]);
    
    NSArray *dataAry = [imageTable getAllRecordFromTable];
    UIImage *image = [UIImage imageWithData:[dataAry[0] objectForKey:@"image"]];
    _imageView.image = image;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
