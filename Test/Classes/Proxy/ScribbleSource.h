//
//  ScribbleSource.h
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"

@protocol ScribbleSource <NSObject>

- (Scribble *)scribble;

@end
