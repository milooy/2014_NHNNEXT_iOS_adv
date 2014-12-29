//
//  FirstViewController.m
//  TabDelegateTest
//
//  Created by Yurim Jin on 2014. 12. 29..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@end
@implementation FirstViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.delegate = self;
    self.firstMutable = [[NSMutableArray alloc] initWithObjects:@"item 1", @"item 2", nil];
    NSLog(@"haha first");
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[SecondViewController class]]){
        SecondViewController *svc = (SecondViewController *) viewController;
        svc.secondMutable = self.firstMutable;
    }
    return TRUE;
}
@end
