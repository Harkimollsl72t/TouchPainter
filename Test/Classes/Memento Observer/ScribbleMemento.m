//
//  ScribbleMemento.m
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"


@implementation ScribbleMemento
@synthesize mark = mark_;   // 执行协议里面的方法 合成相关的属性
@synthesize hasCompleteSnapshot = hasCompleteSnapshot_;

//  我们使用 归档的技术 来持久化 Mark 协议的对象
- (NSData *)data
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mark_];
    return data;
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data
{
    id<Mark>restoredMark = (id<Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:restoredMark];
    return memento;
}

#pragma mark ---- Private methods
- (instancetype)initWithMark:(id<Mark>)aMark
{
    self = [super init];
    if (self) {
        [self setMark:aMark];
    }
    return self;
}



@end






































































