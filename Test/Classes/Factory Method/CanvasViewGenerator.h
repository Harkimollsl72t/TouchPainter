//
//  CanvasViewGenerator.h
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.
//  工厂模式  用于生成 CanvasView
//  当然这里只是 做个 简单的介绍 其实 我们同样直接 使用 canvasView 的 alloc init
//  方法 但是如果 canviewView 需要设置 各种参数 等等的 生成某中特定的样式的 那么这样的
//  工厂模式就是很有用的 增加了代码的封装性

#import <Foundation/Foundation.h>
#import "CanvasView.h"   // 绘图的view

@interface CanvasViewGenerator : NSObject

- (CanvasView *)canvasViewWithFrame:(CGRect )aFrame;

@end
