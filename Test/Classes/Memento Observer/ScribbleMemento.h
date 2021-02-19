//
//  ScribbleMemento.h
//  Test
//
//  Created by DeLongYang on 2017/9/26.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface ScribbleMemento : NSObject
{
    @private
    id<Mark>mark_;
    BOOL hasCompleteSnapshot_;
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data;

- (NSData *)data;

@end
