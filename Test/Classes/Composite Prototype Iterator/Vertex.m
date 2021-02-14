//
//  Vertex.m
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___大诚软件___. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

@synthesize location=location_;
@dynamic color,size;

- (id)initWithLocation:(CGPoint)location
{
    self=[super init];
    if (self) {
        
    }
    return self;
}


- (void)addMark:(id<Mark>)mark
{
    
}
- (void)removeMark:(id<Mark>)mark
{
    
}

- (id<Mark>)childMarkAtIndex:(NSUInteger )index;
{
    return nil;
}

#pragma mark -
#pragma mark -NSCopying method
- (id)copyWithZone:(NSZone *)zone
{
    Vertex *vertexCopy=[[[self class] allocWithZone:zone] initWithLocation:location_];
    return vertexCopy;
    
}


@end
