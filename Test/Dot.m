//
//  Dot.m
//  Test
//
//  Created by John.Chen on 15/11/29.
//  Copyright © 2015年 ___大诚软件___. All rights reserved.
//

#import "Dot.h"

@implementation Dot
@synthesize size=size_,color=color_;

#pragma mark -  
#pragma mak NSCopying delegate method
- (id)copyWithZone:(NSZone *)zone
{
    Dot *dotCopy=[[[self class]allocWithZone:zone] initWithLocation:location_];
    [dotCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    [dotCopy setSize:size_];
    return dotCopy;
}


@end
