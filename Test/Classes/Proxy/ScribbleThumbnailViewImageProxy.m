//
//  ScribbleThumbnailViewImageProxy.m
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "ScribbleThumbnailViewImageProxy.h"

@interface ScribbleThumbnailViewImageProxy()


/**
  图片加载的线程
 */
- (void) forwardImageLoadingThread;

@end

@implementation ScribbleThumbnailViewImageProxy

@synthesize touchCommand = touchCommand_;
@dynamic imagePath;
@dynamic scribblePath;

- (Scribble *)scribble
{
    if (scribble_ == nil) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *scribbleData = [fileManager contentsAtPath:scribblePath_];
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        scribble_ = [Scribble scribbleWithMemento:scribbleMemento];
    }
    
    return scribble_;
}


/**
 重写 image 方法 返回指定的image

 @return
 */
-(UIImage *)image
{
    if (realImage_ == nil) {
        realImage_ = [UIImage imageWithContentsOfFile:imagePath_];
    }
    return  realImage_;
}

// 绘制相关的形状的 view
- (void)drawRect:(CGRect)rect
{
    if (realImage_ == nil)
    {
        // 绘制一个占位符  未绘
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 10.0); // 设置
        const CGFloat dashLengths[2] = {10,3};  // 设置 虚线绘制的样式
        CGContextSetLineDash(context, 3, dashLengths, 2);
        CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
        CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        if (!loadingThreadHasLanuched)
        {
            [self performSelectorInBackground:@selector(forwardImageLoadingThread) withObject:nil];
            loadingThreadHasLanuched = YES;
        }
        
    }
    else  //
    {
        [realImage_ drawInRect:rect];
    }
}

#pragma  mark ---- 私有方法 在某条线程中 加载一个图片
- (void)forwardImageLoadingThread
{
    //  在ARC 中 autoreleasePool 不能使用这个 变量
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [self image];
    [self performSelectorInBackground:@selector(setNeedsLayout) withObject:nil];
    
}

#pragma mark ----  Touch Event Handlers  处理 UITouch事件
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // toucheCommand 执行相关的命名
    [touchCommand_ execute];
}














@end












































































































