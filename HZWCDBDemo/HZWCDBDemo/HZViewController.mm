//
//  HZViewController.m
//  HZWCDBDemo
//
//  Created by 季怀斌 on 05/03/2018.
//  Copyright © 2018 huazhuo. All rights reserved.
//

#import "HZViewController.h"
//
#import "HZMessage.h"
#import "HZMessage+WCTTableCoding.h"
//
#import "HZDB.h"
@interface HZViewController ()

@end

@implementation HZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HZDB *msgDB = [HZDB sharedDefault];
    [msgDB creatDataTable:@"HZMessage" dataClass:[HZMessage class]];
}
- (IBAction)addData:(id)sender {
    //插入
    HZMessage *message = [[HZMessage alloc] init];
    message.localID = random();
    message.content = @"Hello, 22323232323!";
    message.createTime = [NSDate date];
    message.modifiedTime = [NSDate date];
    
    HZMessage *message2 = [[HZMessage alloc] init];
    message2.localID = random();
    message2.content = @"Hello, 22324444422222211111";
    message2.createTime = [NSDate date];
    message2.modifiedTime = [NSDate date];
    //
    //    BOOL result = [[HZDB sharedDefault] insertObjects:@[message, message2] into:@"HZMessage"];
    BOOL result = [[HZDB sharedDefault] insertOrReplaceObjects:@[message, message2] into:@"HZMessage"];
    if (result == YES) {
        NSLog(@"--------新增成功");
    } else {
        NSLog(@"--------新增失败");
    }
}

- (IBAction)deleteData:(id)sender {
    //删除
    //DELETE FROM message WHERE localID>0;
    BOOL result = [[HZDB sharedDefault] deleteObjectsFromTable:@"HZMessage"
                                                         where:HZMessage.localID > 0];
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
    message.content = @"Hello, HZHZHZHZHZHZHHZ!";
    BOOL result = [[HZDB sharedDefault] updateAllRowsInTable:@"HZMessage" onProperty:HZMessage.content withObject:message];
    if (result == YES) {
        NSLog(@"--------修改成功");
    } else {
        NSLog(@"--------修改失败");
    }
}

- (IBAction)getData:(id)sender {
    
    //查询
    //SELECT * FROM message ORDER BY localID
    //    NSArray<HZMessage *> *message = [[HZDB sharedDefault] getObjectsOfClass:HZMessage.class
    //                                                                  fromTable:@"HZMessage"
    NSArray<HZMessage *> *message = [[HZDB sharedDefault] getObjectsOfClass:HZMessage.class
                                                                  fromTable:@"HZMessage"
                                                                    orderBy:HZMessage.createTime.order(WCTOrderedDescending)];
    
    //    NSArray<HZMessage *> *message = [[HZDB sharedDefault] getObjectsOfClass:HZMessage.class fromTable:@"HZMessage" where:HZMessage.content.like("hz") && HZMessage.createTime.order(WCTOrderedAscending)];
    
    
    for (HZMessage *msg in message) {
        NSLog(@"--%d----:%@------%d--------%@", msg.localID, msg.content, msg.unused, msg.createTime);
    }
}- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
