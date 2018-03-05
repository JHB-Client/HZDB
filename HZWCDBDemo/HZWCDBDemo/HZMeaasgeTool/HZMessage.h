//
//  HZMessage.h
//  HZWCDBDemo
//
//  Created by 季怀斌 on 2018/2/1.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HZMessage : NSObject
@property int localID;
@property(retain) NSString *content;
@property(retain) NSDate *createTime;
@property(retain) NSDate *modifiedTime;
@property(assign) int unused; //You can only define the properties you need

@end
