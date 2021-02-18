//
//  ScribbleThumbnailViewImageProxy.h
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
/*
    1.0 注意对比 在  imagePath 和 scribblePath 在父类中的@synthesize 修饰的
    在本类中变成了@dynamic 修饰的
    2.0  这个是最核心的 类负责 类似于canvas 负责绘制
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
@property (nonatomic,readonly)Scribble *scribble;
@property (nonatomic,strong)Command *touchCommand;


@end
