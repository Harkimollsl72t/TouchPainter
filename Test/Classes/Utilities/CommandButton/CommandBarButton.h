//
//  CommandBarButton.h
//  Test
//
//  Created by DeLongYang on 2017/9/25.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.
//  带有  

#import <UIKit/UIKit.h>

@class Command;

@interface CommandBarButton : UIBarButtonItem

@property (nonatomic,strong)Command *command;

@end
