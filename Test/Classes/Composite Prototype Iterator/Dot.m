//
//  Dot.m
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___杨德龙___. All rights reserved.
//

#import "Dot.h"

@implementation Dot
@synthesize size=size_,color=color_;


#pragma mark -  
#pragma mak NSCopying delegate method
- (id)copyWithZone:(NSZone *)zone
{
    Dot *dotCopy=[[[self class]allocWithZone:zone] initWithLocation:location_];
    [dotCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    [dotCopy setSize:size_];
    return dotCopy;
}

#pragma mark --- 访问者模式 接受访问者
- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor
{
    // 引入一个 visitor  来绘制 dot
    [visitor visitDot:self];
}

#pragma mark ---   NSCode 协议
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        color_ = [aDecoder decodeObjectForKey:@"DotColor"];
        size_ = [aDecoder decodeFloatForKey:@"DotSize"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:color_ forKey:@"DotColor"];
    [aCoder encodeFloat:size_ forKey:@"DotSize"];
}


// 这是一个 错误的 一般用这种方式来写  来对比 访问者模式  这种方法
#pragma mark ----  An extended Direct - draw  Example
- (void)drawWithContext:(CGContextRef)context
{
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(x - frameSize/2.0, y - frameSize/2.0, frameSize, frameSize);
    
    //
    CGContextSetFillColorWithColor(context, [self color].CGColor);
    CGContextFillEllipseInRect(context, frame);
    
}














































































































































































































































@end
