//
//  UIView+UIImage.h
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//  将某个view 转换为 相应的image

#import <UIKit/UIKit.h>

@interface UIView (UIImage)


/**
 将某个 view 转换为某个 image  这种image 会根据 手机的屏幕的 尺寸 来计算

 @return 返回 某个view 的截屏
 */
- (UIImage *)image;


@end
