//
//  CoordinatingController.h
//  Test
//
//  Created by DeLongYang on 2017/9/24.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
/*
    2017-9-24 更新
    这是一个 VC 跳转的 中枢 类 这是一个单例的方法 
    在MRC 中单例的写法 有点复杂  使用 GCD 可以简化 这个流程 在设计模式中 又称之为
    中间者
 */

#import <Foundation/Foundation.h>
#import "CanvasViewController.h"   //

typedef enum {
    kButtonTagDone,
    kButtonTagOpenPaletteView,
    kButtonTagOpenThumbnailView
}ButtonTag;


@interface CoordinatingController : NSObject
{
    
}


+ (CoordinatingController *)sharedInstance;

@property (nonatomic,readonly,strong)  UIViewController *activeViewController;

@property (nonatomic, readonly) CanvasViewController *canvasViewController;


/**
 根据 object 来改变VC

 @param object object description
 */
- (void)requestViewChangeByObject:(id)object;


@end
