//
//  UIView+UIImage.m
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.
//

#import "UIView+UIImage.h"

@implementation UIView (UIImage)

- (UIImage *)image
{
    CGSize size = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    //  注意起点是从0 开始的
    CGRect rec = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [self drawViewHierarchyInRect:rec afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;

}



/*
   下面这是 老的方法
 CGSize imageSize = [self bounds].size;// [[UIScreen mainScreen] bounds].size;
 
 if (NULL != UIGraphicsBeginImageContextWithOptions)
 UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
 else
 UIGraphicsBeginImageContext(imageSize);
 
 CGContextRef context = UIGraphicsGetCurrentContext();
 
 // Iterate over every window from back to front
 for (UIWindow *window in [[UIApplication sharedApplication] windows])
 {
 if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
 {
 // -renderInContext: renders in the coordinate space of the layer,
 // so we must first apply the layer's geometry to the graphics context
 CGContextSaveGState(context);
 // Center the context around the window's anchor point
 CGContextTranslateCTM(context, [window center].x, [window center].y);
 // Apply the window's transform about the anchor point
 CGContextConcatCTM(context, [window transform]);
 // Offset by the portion of the bounds left of and above the anchor point
 CGContextTranslateCTM(context,
 -[window bounds].size.width *[[window layer] anchorPoint].x,
 -[window bounds].size.height *[[window layer] anchorPoint].y);
 
 // Render the layer hierarchy to the current context
 [[window layer] renderInContext:context];
 
 // Restore the context
 CGContextRestoreGState(context);
 }
 }
 
 // Retrieve the screenshot image
 UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
 
 UIGraphicsEndImageContext();
 
 return image;
 */

@end
