//
//  PaperCanvasView.m
//  Test
//
//  Created by meitianhui2 on 2017/11/21.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "PaperCanvasView.h"

@implementation PaperCanvasView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Add a cloth image view on top
        // as the canvas background   加上一个 图片作为一个 背景图
        UIImage *backgroundImage = [UIImage imageNamed:@"paper"];
        UIImageView *backgroundView = [[UIImageView alloc]
                                       initWithImage:backgroundImage];
        [self addSubview:backgroundView];
    }
    return self;
}

@end
