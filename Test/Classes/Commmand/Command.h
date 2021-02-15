//
//  Command.h
//  Test
//
//  Created by DeLongYang on 2017/9/24.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.
/*
    这是一个抽象的 command 类  主要用于子类的计算
 */

#import <Foundation/Foundation.h>

@interface Command : NSObject

@property (nonatomic,strong)NSDictionary *userInfo;

- (void)execute;

- (void)undo;


@end
