//
//  ScribbleThumbnailViewImageProxy.h
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
/*
    注意对比 同样的属性名称 和 父类中的区别
 */

#import "ScribbleThumbnailView.h"
#import "Scribble.h"
#import "ScribbleSource.h"   // 这是一个 source的view
#import "Command.h"  // command 的写法

@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView
{
    @private
    Scribble *scribble_;
    Command  *touchCommand_;
    UIImage  *realImage_;
    BOOL     loadingThreadHasLanuched;  // 加载的线程已经开启了
}

@property (nonatomic,readonly)UIImage *image;





@end
