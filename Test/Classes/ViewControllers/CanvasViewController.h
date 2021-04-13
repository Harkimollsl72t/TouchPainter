//
//  CanvasViewController.h
//  Test
//
//  Created by DeLongYang on 2017/9/24.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "CanvasView.h"
#import "CanvasViewGenerator.h"
#import "CommandBarButton.h"
#import "NSMutableArray+Stack.h"

@interface CanvasViewController : UIViewController
{
@private
    Scribble *scribble_;
    CanvasView *canvasView_;
    
    CGPoint startPoint_;
    UIColor *strokeColor_;
    CGFloat strokeSize_;
}

@property (nonatomic, strong) CanvasView *canvasView;
@property (nonatomic, strong) Scribble *scribble;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;

@end
