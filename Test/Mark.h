//
//  Mark.h
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___软件___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Mark <NSObject>

@property (nonatomic,strong)UIColor * color;
@property (nonatomic,assign)CGFloat size;
@property (nonatomic,assign)CGPoint location;
@property (nonatomic,readonly)NSUInteger count;
@property (nonatomic,readonly)id<Mark>lastChild;

- (id)copy;
- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger )index;


@end
