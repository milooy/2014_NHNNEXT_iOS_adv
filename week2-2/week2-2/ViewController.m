//
//  ViewController.m
//  week2-2
//
//  Created by Yurim Jin on 2014. 10. 23..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    int oriX;
    int oriY;
    int curX;
    int curY;
    CGPoint originPoint;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGesture];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    originPoint = CGPointMake(_catImg.center.x, _catImg.center.y);
    [self becomeFirstResponder];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addGesture
{
    //: 드래그
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    pan.minimumNumberOfTouches = 1;
    pan.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:pan];
    
    // 더블탭
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self
                                                          action:@selector(handleDoubleTap:)];
    [doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTapGestureRecognizer];
    
    
    //: 핀치
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    pinch.delegate = self;
    [self.view addGestureRecognizer:pinch];

}

-(void)handlePanGesture:(UIGestureRecognizer *)recognizer
{
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer*)recognizer;
    CGPoint delta = [pan translationInView:pan.view];
    [_catImg setCenter:CGPointMake(_catImg.center.x + delta.x, _catImg.center.y + delta.y)];
    [pan setTranslation:CGPointZero inView:_catImg];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [_catImg setCenter:originPoint];

    }
    
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:self.view];
    [_catImg setCenter:location];
    NSLog(@"haha");
}

-(void)handlePinchGesture:(UIGestureRecognizer *)recognizer
{
    static CGRect initialBounds;
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        initialBounds = _catImg.bounds;
    }
    CGFloat factor = [(UIPinchGestureRecognizer *)recognizer scale];
    
    CGAffineTransform zoom = CGAffineTransformScale(CGAffineTransformIdentity, factor, factor);
    _catImg.bounds = CGRectApplyAffineTransform(initialBounds, zoom);
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (![gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] && ![otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventSubtypeMotionShake) {
        [_catImg setCenter:originPoint];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
