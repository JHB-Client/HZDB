//
//  HZDB.h
//  HZWCDBDemo
//
//  Created by 季怀斌 on 2018/3/5.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import <WCDB/WCDB.h>
#import "HZDBMacro.h"
@interface HZDB : WCTDatabase
HZDBMacroH(Default)
- (void)creatDataTable:(NSString *)tableName dataClass:(Class<WCTTableCoding>)cls;
@end
