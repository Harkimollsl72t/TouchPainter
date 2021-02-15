//
//  NSMutableArray+Stack.h
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.
/*
    使用说明 我们知道数组中添加  和 移除 没有考虑 为空的情况
    以及数组安全的 特性
 */

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)


/**
 压栈 某个 元素

 @param object object description
 */
- (void)push:(id)object;


/**
 安全 弹出  栈列中的 元素

 @return 出栈的第一个元素
 */
- (id)pop;

/**
 移除第一个 元素
 */
- (void)dropBottom;


@end
