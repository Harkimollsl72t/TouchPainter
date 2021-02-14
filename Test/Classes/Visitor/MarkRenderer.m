//
//  MarkRenderer.m
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "MarkRenderer.h"

@implementation MarkRenderer

- (id)initWithCGContext:(CGContextRef)context
{
    if (self = [super init]) {
        context_ = context;
        shouldMoveContextToDot_ = YES;   // 是否移动
    }
    
    return self;
}

#pragma mark -  MarkVisitor
- (void)visitMark:(id<Mark>)mark
{
    // 这里有默认的 behavior
}

- (void)visitDot:(Dot *)dot
{
    CGFloat x = [dot location].x;
    CGFloat y = [dot location].y;
    
    CGFloat frameSize = [dot size];
    CGRect frame = CGRectMake(x-frameSize/2.0, y-frameSize/2.0, frameSize, frameSize);
    CGContextSetFillColorWithColor(context_, [[dot color] CGColor]);
    CGContextFillEllipseInRect(context_, frame);
}

- (void)visitStroke:(Stroke *)stroke
{
    CGContextSetStrokeColorWithColor(context_, [[stroke color] CGColor]);
    CGContextSetLineWidth(context_, [stroke size]);
    CGContextSetLineCap(context_, kCGLineCapRound);
    CGContextStrokePath(context_);
    shouldMoveContextToDot_ = YES;   // 需要 移动到下一个点
    
}

- (void)visitVertex:(Vertex *)vertex
{
    CGFloat x = [vertex location].x;
    CGFloat y = [vertex location].y;
    
    if (shouldMoveContextToDot_)
    {
        // 不需要移动某个点  直接画
        CGContextMoveToPoint(context_, x, y);
        shouldMoveContextToDot_ = NO;
    }
    else
    {
        //  直接 划线
        CGContextAddLineToPoint(context_, x, y);
    }
    
}






@end


















