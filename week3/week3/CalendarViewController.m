//
//  CalendarViewController.m
//  week3
//
//  Created by Yurim Jin on 2014. 10. 30..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* comp = [cal components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    //return [comp weekday]; // 1 = Sunday, 2 = Monday, etc.
//    date = [NSDate dateWithTimeIntervalSince1970:1245980099];
//    com = [[NSCalendar currentCalendar] components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:date];
    NSLog(@"haha: %ld, %ld, %ld, %ld", (long)[comp weekday], (long)[comp day], (long)[comp year],(long)[comp month]);
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];        // 시간은 표시 하지 말고
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];    // 날짜만 표시
    
    NSLog(@"<today with NO dateFormatter     >  %@", today);
    NSLog(@"<today with dateFormatter        >  %@", [dateFormatter stringFromDate:today]);
    
    for (int i=1; i<=7; i++) {
        CGRect myRect = CGRectMake(2 + i*30, 30.0, 160.0, 40.0);
        [self titleForBtn:[NSString stringWithFormat: @"%d", i] position:myRect];
    }
    

    

}

- (void)titleForBtn:(NSString *)title position:(CGRect)position {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = position;
    [self.view addSubview:button];
    
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
