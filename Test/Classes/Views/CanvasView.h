//
//  CanvasView.h
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.
/*
    可以自己绘制 线条 和点 等的view
 */

#import <UIKit/UIKit.h>

@protocol Mark;


@interface CanvasView : UIView
{
}

@property (nonatomic,strong)id<Mark>mark;




@end
