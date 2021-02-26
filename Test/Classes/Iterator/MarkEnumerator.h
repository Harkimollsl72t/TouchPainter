//
//  MarkEnumerator.h
//  Test
//
//  Created by DeLongYang on 2017/10/5.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"
#import "Mark.h"

@interface MarkEnumerator : NSEnumerator
{
    @private
    NSMutableArray *stack_;  // 栈列表
}

- (NSArray *)allObjects;

- (id)nextObject;


@end
