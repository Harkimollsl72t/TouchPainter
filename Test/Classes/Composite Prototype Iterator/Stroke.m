//
//  Stroke.m
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___杨德龙___. All rights reserved.
//

#import "Stroke.h"

@implementation Stroke

@synthesize color=color_,size=size_;
@dynamic location;

- (id)init
{
    self=[super init];
    if (self)
    {
        children_=[[NSMutableArray alloc]initWithCapacity:5];
    }
    return self;
}

- (void)setLocation:(CGPoint)location
{
    // it does not set any aribitary
}


//
- (CGPoint)location
{
    if ([children_ count]>0)
    {
        // 返回第一个  mark 元素的 location
        return [(id<Mark>)[children_ objectAtIndex:0] location];
    }
    return  CGPointZero;
}


- (void)addMark:(id<Mark>)mark
{
    [children_ addObject:mark];
}


- (void)removeMark:(id<Mark>)mark
{
    if ([children_ containsObject:mark])
    {
        [children_ removeObject:mark];
    }
    else
    {
        [children_ makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)childMarkAtIndex:(NSUInteger)index
{
    if (index>=[children_ count])
    {
        return nil;
    }
    return [children_ objectAtIndex:index];
}

// 返回 最后一个child
- (id<Mark>)lastChild
{
    return [children_ lastObject];
}

- (NSUInteger)count
{
    // 返回 子节点的 数量
    return  [children_ count];
}

// 接受 visitor  那么每个子 mark 要渲染 之后 self 开始渲染
- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor
{
    for (id<Mark>dot in children_)
    {
        [dot acceptMarkVisitor:visitor];
    }
    
    [visitor visitStroke:self];
}


#pragma mark ----  NSCopying method
// 这行 nscopy 协议
- (id)copyWithZone:(NSZone *)zone
{
    Stroke  *strokeCopy=[[[self class] allocWithZone:zone] init];
    [strokeCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    [strokeCopy setSize:size_];
    for (id<Mark>child in children_)
    {
        id<Mark>childCopy=[child copy];
        [strokeCopy addMark:childCopy];
    }
    return strokeCopy;
}

#pragma mark ---- NSCoder methods
- (id)initWithCoder:(NSCoder *)aDecoder
{
    //
    if (self = [self init])  // 注意这里 初始化 和 initWithCoder 的区别
    {
        color_ = [aDecoder decodeObjectForKey:@"StrokeColor"];
        size_ = [aDecoder decodeFloatForKey:@"StrokeSize"];
        children_ = [aDecoder decodeObjectForKey:@"StrokeChildren"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:color_ forKey:@"StrokeColor"];
    [aCoder encodeFloat:size_ forKey:@"StrokeSize"];
    [aCoder encodeObject:children_ forKey:@"StrokeChildren"];
}

#pragma mark ---- enumerator method

//  返回一个 自定义的 迭代器  用于遍历 mark 中的元素
- (NSEnumerator *)enumerator
{
    return  nil;
}













































































































@end
