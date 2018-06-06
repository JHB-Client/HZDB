//
//  HZMessage+WCTTableCoding.h
//  HZWCDBDemo
//
//  Created by 季怀斌 on 2018/2/1.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZMessage.h"
#import "HZDB.h"
@interface HZMessage (WCTTableCoding)<WCTTableCoding>
#pragma mark ----------------- 表的字段！！！！ ------------------
WCDB_PROPERTY(localID)
WCDB_PROPERTY(content)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(modifiedTime)
WCDB_PROPERTY(unused)
@end
