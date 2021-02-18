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





@end
