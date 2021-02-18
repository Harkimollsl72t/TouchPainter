//
//  ScribbleThumbnailView.h
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
/*
    注意 ScribbleThumbnailView 的属性的修饰  
 */

#import <UIKit/UIKit.h>
#import "ScribbleSource.h"
#import "Scribble.h"

@interface ScribbleThumbnailView : UIView
{
    @protected
    NSString *imagePath_;
    NSString *scribblePath_;
}

@property (nonatomic,readonly)UIImage *image;

@property (nonatomic,readonly)Scribble *scribble;

@property (nonatomic, copy) NSString *imagePath;

@property (nonatomic, copy) NSString *scribblePath;

@end
