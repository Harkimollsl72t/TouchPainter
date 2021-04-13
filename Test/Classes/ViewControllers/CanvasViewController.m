//
//  CanvasViewController.m
//  Test
//
//  Created by DeLongYang on 2017/9/24.
//  Copyright © 2017年 ___杨德龙___. All rights reserved.



#import "CanvasViewController.h"
#import "Scribble.h"
#import "CanvasView.h"
#import "CanvasViewGenerator.h"
#import "CommandBarButton.h"
#import "NSMutableArray+Stack.h"
#import "Stroke.h"
#import "Vertex.h"
#import "Dot.h"

static NSString *redValueKey = @"red";
static NSString *greenValueKey = @"green";
static NSString *blueValueKey = @"blue";
static NSString *sizeValueKey = @"size";
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height


@interface CanvasViewController ()


@end

@implementation CanvasViewController
@synthesize canvasView = canvasView_;
@synthesize scribble = scribble_;
@synthesize strokeColor = strokeColor_;
@synthesize strokeSize = strokeSize_;


- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self initUI];
    [self initScribble];
    [self restoreLastSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---- Setter
- (void)setScribble:(Scribble *)scribble
{
    if (scribble != scribble_) {
        scribble_ = scribble;
        [scribble_ addObserver:self
                    forKeyPath:@"mark"
                       options:NSKeyValueObservingOptionInitial |
         NSKeyValueObservingOptionNew
                       context:nil];
    }
}

// 重写 setter 方法 使得 最小的strokeSize 是5.0
- (void)setStrokeSize:(CGFloat)strokeSize
{
    if (strokeSize < 5.0) {
        strokeSize_ = 5.0;
    }else{
        strokeSize_ = strokeSize;
    }
}


#pragma mark ----  初始化 UI
- (void)initUI
{
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
    if (canvasView_) {
        [canvasView_ removeFromSuperview];
    }
    CGRect aFrame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    CanvasView *canvasView = [defaultGenerator canvasViewWithFrame:aFrame];
    canvasView_.backgroundColor = [UIColor yellowColor];
    [self setCanvasView:canvasView];
//    NSInteger viewIndex = [[self.view subviews] count] -1;
//    [self.view insertSubview:canvasView atIndex:viewIndex];
    [self.view addSubview:canvasView];
    
}

- (void)initScribble
{
    Scribble *scribble = [[Scribble alloc] init];
    [self setScribble:scribble];
}

- (void)restoreLastSetting
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:redValueKey];
    CGFloat greenValue = [userDefaults floatForKey:greenValueKey];
    CGFloat blueValue = [userDefaults floatForKey:blueValueKey];
    CGFloat sizeValue = [userDefaults floatForKey:sizeValueKey];
    [self setStrokeSize:sizeValue];
    [self setStrokeColor:[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0]];

}

#pragma mark ---- Touch Event Handlers
// touch  事件开始
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    startPoint_ = [[touches anyObject] locationInView:canvasView_];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint lastPoint = [[touches anyObject] preciseLocationInView:canvasView_];
    if (CGPointEqualToPoint(lastPoint, startPoint_))
    {
        //
        id<Mark> newStroke = [[Stroke alloc] init];
        [newStroke setColor:strokeColor_];
        [newStroke setSize:strokeSize_];
        //
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&newStroke atIndex:2];
        //
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&newStroke atIndex:2];
        //
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
    }
    
    //
    CGPoint thisPoint = [[touches anyObject] locationInView:canvasView_];
    Vertex *vertex = [[Vertex alloc] initWithLocation:thisPoint];
    [scribble_ addMark:vertex shouldAddToPreviousMark:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:canvasView_];
    CGPoint thisPoint = [[touches anyObject] locationInView:canvasView_];
    //
    if (CGPointEqualToPoint(lastPoint, thisPoint))
    {
        Dot *singleDot = [[Dot alloc] initWithLocation:thisPoint];
        [singleDot setColor:strokeColor_];
        [singleDot setSize:strokeSize_];
        //
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&singleDot atIndex:2];
        //
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&singleDot atIndex:2];
        //
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
    }
    
    //  重置 为 0 开始的点
    startPoint_ = CGPointZero;
}

// touch 事件 取消
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //
    startPoint_ = CGPointZero;
}

#pragma mark ---- Draw Scribble Invocation Method
- (NSInvocation *)drawScribbleInvocation
{
    NSMethodSignature *executeMethodSignature = [scribble_ methodSignatureForSelector:@selector(addMark:shouldAddToPreviousMark:)];
    NSInvocation *drawInvocation = [NSInvocation invocationWithMethodSignature:executeMethodSignature];
    [drawInvocation setTarget:scribble_];
    
    [drawInvocation setSelector:@selector(addMark:shouldAddToPreviousMark:)];
    BOOL attachToPreviousMark = NO;
    [drawInvocation setArgument:&attachToPreviousMark atIndex:3];
    return  drawInvocation;
}

- (NSInvocation *)undrawScribbleInvocation
{
    NSMethodSignature *unexecuteMethodSignature = [scribble_ methodSignatureForSelector:@selector(removeMark:)];
    NSInvocation *undrawInvocation = [NSInvocation invocationWithMethodSignature:unexecuteMethodSignature];
    [undrawInvocation setTarget:scribble_];
    [undrawInvocation setSelector:@selector(removeMark:)];
    return  undrawInvocation;
}

#pragma mark ----  Draw Scribble Command Method
- (void)executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvacation
{
    [invocation retainArguments];
    // 每个 VC 都有一个  undoManager
    [[self.undoManager prepareWithInvocationTarget:self] unexecuteInvocation:undoInvacation withRedoInvocation:invocation];
    
    // Invocation 执行相关的 命令
    [invocation invoke];
}

- (void)unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation
{
    [[self.undoManager prepareWithInvocationTarget:self] executeInvocation:redoInvocation withUndoInvocation:invocation];
    [invocation invoke];
}

#pragma Mark ---- KVC Scribble Observer Method
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    // scribble class and  mark Path
    if ([object isKindOfClass:[Scribble class]] && [keyPath isEqualToString:@"mark"])
    {
        id<Mark>mark = (id<Mark>)[change objectForKey:NSKeyValueChangeNewKey];
        [canvasView_ setMark:mark];
        [canvasView_ setNeedsDisplay];   // 重新绘制
    }
}

















@end
