//
//  MarkRenderer.h
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//  Mark 的渲染器  包括 接受访问者 等的

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

@interface MarkRenderer : NSObject<MarkVisitor>
{
    @private
    BOOL shouldMoveContextToDot_;
    
    @protected
    CGContextRef context_;
}

// 根据 context 得到相应的渲染器 
- (id)initWithCGContext:(CGContextRef )context;

#pragma mark -  MarkVisitor
- (void)visitMark:(id<Mark>)mark;

- (void)visitDot:(Dot *)dot;

- (void)visitStroke:(Stroke *)stroke;

- (void)visitVertex:(Vertex *)vertex;





@end
