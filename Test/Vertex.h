//
//  Vertex.h
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___大诚软件___. All rights reserved.
//  轨迹的顶点

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface Vertex : NSObject<Mark,NSCopying>
{
    @protected
    CGPoint location_;
}

@property (nonatomic,strong)UIColor * color;
@property (nonatomic,assign)CGFloat size;
@property (nonatomic,assign)CGPoint location;
@property (nonatomic,readonly)NSUInteger count;
@property (nonatomic,readonly)id<Mark>lastChild;

- (id)initWithLocation:(CGPoint )location;

- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger )index;

- (id)copyWithZone:(NSZone *)zone;


@end
