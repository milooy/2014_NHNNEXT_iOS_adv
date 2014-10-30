//
//  ViewController.m
//  week3
//
//  Created by Yurim Jin on 2014. 10. 30..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)secondBtnClick:(id)sender {
    NSLog(@"clicked");
    UIStoryboard *secondSt = [UIStoryboard storyboardWithName:@"Second" bundle:nil];
    
    UITableViewController *SecondViewController = [secondSt instantiateInitialViewController];
    [self presentViewController:SecondViewController animated:NO completion:nil];
    //[self.view addSubview:SecondViewController.view];
}
@end
