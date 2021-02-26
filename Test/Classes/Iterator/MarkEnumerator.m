//
//  MarkEnumerator.m
//  Test
//
//  Created by DeLongYang on 2017/10/5.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "MarkEnumerator.h"

@implementation MarkEnumerator

- (NSArray *)allObjects
{
    return nil;
}

- (id)nextObject
{
    return [stack_ pop];
}


#pragma mark ----  Private Methods
- (id)initWithMark:(id<Mark>)aMark
{
    if (self = [super init]) {
//        stack_ =
    }
    return self;
}
























































































@end
