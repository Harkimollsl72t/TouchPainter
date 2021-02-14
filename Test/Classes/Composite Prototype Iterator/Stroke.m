//
//  Stroke.m
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___大诚软件___. All rights reserved.
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
    
}


- (CGPoint)location
{
    if ([children_ count]>0)
    {
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



@end
