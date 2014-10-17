//
//  ViewController.m
//  week1
//
//  Created by Yurim Jin on 2014. 10. 16..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"
#include "KString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    String* aString = new String();
    aString->capacity();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
