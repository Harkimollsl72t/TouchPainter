//
//  Dot.h
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___大诚软件___. All rights reserved.
//

#import "Vertex.h"

@interface Dot : Vertex
{
    @private
    UIColor *color_;
    CGFloat size_;
}

@property (nonatomic,retain)UIColor * color;
@property (nonatomic,assign)CGFloat size;

- (id)copyWithZone:(NSZone *)zone;


@end
