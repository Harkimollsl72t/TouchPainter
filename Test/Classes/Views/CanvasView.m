//
//  CanvasView.m
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"    //  这是一个

@implementation CanvasView

//  默认设置成白色的
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

// 只做 自定义的 绘制操作  也是 整个实现 最关键的地方
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    MarkRenderer *markerRender = [[MarkRenderer alloc]initWithCGContext:context];
    
    // 将 render 传给 mark  来绘制具体的操作
    [_mark acceptMarkVisitor:markerRender];
    
}

@end
