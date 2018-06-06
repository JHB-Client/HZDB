//
//  HZMessage.m
//  HZWCDBDemo
//
//  Created by 季怀斌 on 2018/2/1.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZMessage.h"
#import "HZDB.h"
@implementation HZMessage
WCDB_IMPLEMENTATION(HZMessage)
WCDB_SYNTHESIZE(HZMessage, localID)
WCDB_SYNTHESIZE(HZMessage, content)
WCDB_SYNTHESIZE(HZMessage, createTime)
WCDB_SYNTHESIZE(HZMessage, modifiedTime)
WCDB_SYNTHESIZE(HZMessage, unused)
//
WCDB_PRIMARY(HZMessage, localID)
//
WCDB_INDEX(HZMessage, "_index", createTime)
@end
