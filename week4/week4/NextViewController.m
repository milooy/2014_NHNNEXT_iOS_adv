//
//  NextViewController.m
//  week4
//
//  Created by Yurim Jin on 2014. 11. 6..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController () <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>
@property (nonatomic) BOOL presentMode;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    }

#pragma UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}


- (IBAction)backBtnPressed:(id)sender {
    NSLog(@"hhhhh");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
