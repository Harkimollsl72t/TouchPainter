//
//  Dot.h
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___杨德龙___. All rights reserved.
//

#import "Vertex.h"

@interface Dot : Vertex
{
    @private
    UIColor *color_;
    CGFloat size_;
}

@property (nonatomic,strong)UIColor * color;
@property (nonatomic,assign)CGFloat size;

- (id)copyWithZone:(NSZone *)zone;

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor;


- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;









@end
