//
//  Detail.m
//  week4
//
//  Created by Yurim Jin on 2014. 11. 6..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "Detail.h"

@interface Detail ()

@end

@implementation Detail

@synthesize name;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"name: %@", name);
//    _name_label.text = _name;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
