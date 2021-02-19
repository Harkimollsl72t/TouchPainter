//
//  ScribbleMemento+Friend.h
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"


@interface ScribbleMemento ()

- (instancetype)initWithMark:(id<Mark>)aMark;

@property (nonatomic,copy)id<Mark>mark;

/**
 完成了 截屏
 */
@property (nonatomic,assign) BOOL hasCompleteSnapshot;

@end
