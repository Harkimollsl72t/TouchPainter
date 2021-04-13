//
//  Scribble.m
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "Scribble.h"
#import "ScribbleMemento.h"
#import "Stroke.h"   //
#import "ScribbleMemento+Friend.h"

@interface Scribble ()

@property (nonatomic, strong) id <Mark> mark;

@end


@implementation Scribble

@synthesize mark = parentMark_;

/**
 根据一个 记忆的草稿 初始一个scrible
 
 @param amemento amemento description
 @return return value description
 */
- (instancetype)initWithMemento:(ScribbleMemento *)aMemento
{
    if (self = [super init])
    {
        if ([aMemento hasCompleteSnapshot])
        {
            [self setMark:[aMemento mark]];
        }
        else
        {
            //
            parentMark_ = [[Stroke alloc] init];
            [self attachStateFromMemento:aMemento];
        }
    }
    return self;
}

+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)aMemento
{
    Scribble *scribble = [[Scribble alloc] initWithMemento:aMemento];
    return scribble;
}


//
- (instancetype)init
{
    self = [super init];
    if (self) {
        parentMark_ =[[Stroke alloc] init];
    }
    return self;

}




#pragma mark ----  method for mark management
- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark
{
    // 手动触发 KVO
    [self willChangeValueForKey:@"mark"];
    
    // 父节点的 lastChild
    if (shouldAddToPreviousMark)
    {
        [[parentMark_ lastChild] addMark:aMark];
    }
    else
    {
        [parentMark_ addMark:aMark];
        incrementalMark_ = aMark;
    }
    
    // KVO  确实 改变了mark的值
    [self didChangeValueForKey:@"mark"];
}


/**
 移除掉 某个
 
 @param aMark
 */
- (void)removeMark:(id<Mark>)aMark
{
    // 父mark 应当是 父mark 或者 父父mark等依次的mark的事情
    if (aMark == parentMark_) {
        return;
    }
    
    [self willChangeValueForKey:@"mark"];
    
    [parentMark_ removeMark:aMark];
    
    // 我们没有必要 留下incrementalMark 直接移除就可以了
    if (aMark == incrementalMark_)  //
    {
        incrementalMark_ = nil;
    }
    
    // 不论是 增加 还是 remove 都会引起 mark的改变
    [self didChangeValueForKey:@"mark"];
    
}

//
- (void)attachStateFromMemento:(ScribbleMemento *)memento
{
    // attach a mark to the main parent
    [self addMark:[memento mark] shouldAddToPreviousMark:NO];
}

#pragma mark ---- 返回ScribbleMemento 的方法
// 默认的 scribble 是需要截取 屏幕的
- (ScribbleMemento *)scribbleMemento
{
   return  [self scribbleMementoWithCompleteSnapshot:YES];
}

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshop
{
    id<Mark> mementoMark = incrementalMark_;
    if (hasCompleteSnapshop)
    {
        mementoMark = parentMark_;
    }
    else if(mementoMark == nil)
    {
        return nil;
    }
    
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:mementoMark];
    [memento setHasCompleteSnapshot:hasCompleteSnapshop];
    return memento;
}




@end



























