//
//  MarkEnumerator+Internal.h
//  Test
//
//  Created by DeLongYang on 2017/10/5.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "MarkEnumerator.h"


@interface MarkEnumerator ()

- (id)initWithMark:(id<Mark>)mark;

- (void)traverseAndBuildStackWithMark:(id<Mark>)mark;

@end
