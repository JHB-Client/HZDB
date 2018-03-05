//
//  ViewController.m
//  HZWCDBDemo
//
//  Created by 季怀斌 on 2017/12/18.
//  Copyright © 2017年 huazhuo. All rights reserved.
//

#import "ViewController.h"
//
#import "HZMessage.h"
#import "HZMessage+WCTTableCoding.h"
//
#import "HZDB.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setDataBase];
}

- (void)setDataBase {
    HZDB *msgDB = [HZDB sharedDefault];
    [msgDB creatDataTable:@"Message" dataClass:HZMessage.class];
}
- (IBAction)addData:(id)sender {
    //插入
    HZMessage *message = [[HZMessage alloc] init];
    message.localID = random();
    message.content = @"Hello, WCDB!";
    message.createTime = [NSDate date];
    message.modifiedTime = [NSDate date];
    //
    BOOL result = [[HZDB sharedDefault] insertObject:message into:@"Message"];
    if (result == YES) {
        NSLog(@"--------新增成功");
    } else {
        NSLog(@"--------新增失败");
    }
}

- (IBAction)deleteData:(id)sender {
    //删除
    //DELETE FROM message WHERE localID>0;
    BOOL result = [[HZDB sharedDefault] deleteObjectsFromTable:@"Message"
                                             where:HZMessage.localID % 2 == 0];
    if (result == YES) {
        NSLog(@"--------删除成功");
    } else {
        NSLog(@"--------删除失败");
    }
}


- (IBAction)updateData:(id)sender {
    
    //修改
    //UPDATE message SET content="Hello, Wechat!";
    HZMessage *message = [[HZMessage alloc] init];
    message.content = [NSString stringWithFormat:@"Hello, Wechat!---%ld", random()];
    BOOL result = [[HZDB sharedDefault] updateAllRowsInTable:@"Message" onProperty:HZMessage.content withObject:message];
    if (result == YES) {
        NSLog(@"--------修改成功");
    } else {
        NSLog(@"--------修改失败");
    }
}

- (IBAction)getData:(id)sender {
    
    //查询
    //SELECT * FROM message ORDER BY localID
    NSArray<HZMessage *> *message = [[HZDB sharedDefault] getObjectsOfClass:HZMessage.class
                                                    fromTable:@"Message"
                                                      orderBy:HZMessage.localID.order()];
    
    
    for (HZMessage *msg in message) {
        NSLog(@"--%d----:%@------%d", msg.localID, msg.content, msg.unused);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
