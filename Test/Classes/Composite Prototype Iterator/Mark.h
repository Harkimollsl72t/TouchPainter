//
//  Mark.h
//  Test
//
//  Created by 杨德龙 on 15/11/29.
//  Copyright © 2015年 ___杨德龙___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"

@protocol Mark <NSObject,NSCopying,NSCoding>

@property (nonatomic,strong)UIColor * color;
@property (nonatomic,assign)CGFloat size;
@property (nonatomic,assign)CGPoint location;
@property (nonatomic,readonly)NSUInteger count;
@property (nonatomic,readonly)id<Mark>lastChild;

- (id)copy;
- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger )index;

//  为 访问者 模式中使用
- (void) acceptMarkVisitor:(id<MarkVisitor>)visitor;

// 迭代 器 模式 我们 获取 某个 对象的迭代器  类似于 nsarray 和 nsdictionary 中类似的
- (NSEnumerator *)enumerator;

- (void)enumerateMarksUsingBlock:(void (^)(id<Mark>item,BOOL *stop))block;


// 如果 不使用  访问者模式 我们可能会采用下面这种方式 但是这是一个错误的示例
- (void)drawWithContext:(CGContextRef )context;










@end
