//
//  Stroke.h
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___大诚软件___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface Stroke : NSObject<Mark,NSCopying>
{
    @private
    UIColor *color_;
    CGFloat size_;
    NSMutableArray *children_;
}

@property (nonatomic,strong)UIColor * color;
@property (nonatomic,assign)CGFloat size;
@property (nonatomic,assign)CGPoint location;
@property (nonatomic,readonly)NSUInteger count;
@property (nonatomic,readonly)id<Mark>lastChild;

- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger )index;
- (id)copyWithZone:(NSZone *)zone;


@end
