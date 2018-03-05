//
//  HZDB.m
//  HZWCDBDemo
//
//  Created by 季怀斌 on 2018/3/5.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZDB.h"

@implementation HZDB
HZDBMacroM(Default)
- (void)creatDataTable:(NSString *)tableName dataClass:(Class<WCTTableCoding>)cls {
    if ([self isTableExists:tableName]) {
        NSLog(@"--------%@已经存在", tableName);
    } else {
        BOOL result = [self createTableAndIndexesOfName:tableName withClass:cls.class];
        if (result == YES) {
            NSLog(@"--------建表%@成功", tableName);
        } else {
            NSLog(@"--------建表%@失败", tableName);
        }
    }
}
@end
