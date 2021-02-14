//
//  CoordinatingController.m
//  Test
//
//  Created by DeLongYang on 2017/9/24.
//  Copyright © 2017年 ___大诚软件___. All rights reserved.
//

#import "CoordinatingController.h"
#import "PaletteViewController.h"  // 调色板 颜料的viewController
#import "ThumbnailViewController.h"  // 指甲 选择 粗细等的

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
    if ([object isKindOfClass:[UIBarButtonItem class]])
    {
        NSInteger tag = [(UIBarButtonItem *)object tag];
        switch (tag)
        {
            case kButtonTagOpenPaletteView:
            {
                // load a paletteViewController  and present
                PaletteViewController *controller = [[PaletteViewController alloc] initWithNibName:@"PaletteViewController" bundle:nil];
                [self.canvasViewController presentViewController:controller animated:YES completion:^{
                    
                }];
                
                //  set the activeViewController to
                //  paletteViewController
                _activeViewController = controller;
                
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                ThumbnailViewController *controller = [[ThumbnailViewController alloc] initWithNibName:@"ThumbnailViewController" bundle:nil];
                [self.canvasViewController presentViewController:controller animated:YES completion:^{
                    
                }];
                
                _activeViewController = controller;
                
            }
                break;
            default:
            {
                [self.canvasViewController dismissViewControllerAnimated:YES completion:^{
                    
                }];
                _activeViewController = _canvasViewController;
                
            }
                break;
        }
    }
    else
    {
        [self.canvasViewController dismissViewControllerAnimated:YES completion:^{
            
        }];
        _activeViewController = _canvasViewController;

    }
}















@end
