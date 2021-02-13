//
//  CoordinatingController.m
//  Test
//
//  Created by DeLongYang on 2017/9/24.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "CoordinatingController.h"

@implementation CoordinatingController

+ (CoordinatingController *)sharedInstance
{
    static dispatch_once_t once;
    static CoordinatingController *coordinatingController;
    dispatch_once(&once, ^{
        coordinatingController = [[self alloc] init];
    });
    
    return coordinatingController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

#pragma mark ----
#pragma mark ----   A method for view transitions
- (void)requestViewChangeByObject:(id)object
{
    
}















@end
