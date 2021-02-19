//
//  Scribble.h
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"          //
#import "ScribbleMemento.h"   //

@interface Scribble : NSObject
{
    @private
    id<Mark>parentMark_;
    id<Mark>incrementalMark_;
}

- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;


/**
 移除掉 某个

 @param aMark
 */
- (void)removeMark:(id<Mark>)aMark;


/**
 根据一个 记忆的草稿 初始一个scrible

 @param amemento amemento description
 @return return value description
 */
- (instancetype)initWithMemento:(ScribbleMemento *)aMemento;


+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)aMemento;

- (ScribbleMemento *)scribbleMemento;

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshop;

- (void)attachStateFromMemento:(ScribbleMemento *)memento;













@end
