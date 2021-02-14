//
//  MarkVisitor.h
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Mark;
@class Dot,Vertex,Stroke;

@protocol MarkVisitor <NSObject>

- (void)visitMark:(id<Mark>)mark;

- (void)visitDot:(Dot *)dot;

- (void)visitVertex:(Vertex *)vertex;

- (void)visitStroke:(Stroke *)stroke;

@end
