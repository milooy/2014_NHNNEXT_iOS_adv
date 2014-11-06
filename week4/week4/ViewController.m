//
//  ViewController.m
//  week4
//
//  Created by Yurim Jin on 2014. 11. 6..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
@property (nonatomic) BOOL presentMode;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *nextViewController = segue.destinationViewController;
    nextViewController.transitioningDelegate = self;
    nextViewController.modalPresentationStyle = UIModalPresentationCustom;
}

#pragma mark - UIViewControllerTransitioningDelegate Methods
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    _presentMode = YES;
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    _presentMode = NO;
    return self;
}

#pragma UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    

    CGRect rect = CGRectMake(100, 100, 150, 150);

    if(_presentMode){
        [[transitionContext containerView] addSubview:fromVC.view];
        [[transitionContext containerView] addSubview:toVC.view];
        
        CGRect startRect = rect;
        startRect.origin.x += 400;
        toVC.view.frame = startRect;
        [UIView animateWithDuration:1 animations:^{
            fromVC.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
            toVC.view.frame = rect;
        }completion:^(BOOL finished){
            [transitionContext completeTransition:YES];
        }];

    } else {
        NSLog(@"kaka");
        [transitionContext completeTransition:YES];
        [[[UIApplication sharedApplication] keyWindow] addSubview:toVC.view];
    }
}
@end
