//
//  MyView.m
//  week2
//
//  Created by Yurim Jin on 2014. 10. 23..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "MyView.h"

@implementation MyView {
    int oriX;
    int oriY;
    int curX;
    int curY;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch	*touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    
    oriX = location.x;
    oriY = location.y;
    
//    NSLog(@"Touch Down X = %d, Y = %d", oriX, oriY);
    
    //testLabel 을 사용자가 터치했는지 여부 판단
    /*
    if (CGRectContainsPoint(testLabel.frame, location))
    {
        NSLog(@"TestLabel Touch OK!");
    }
     */
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch	*touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    
    curX = location.x;
    curY = location.y;
    
    float distance = (oriX-curX)*(oriX-curX) + (oriY-curY)*(oriY-curY);
    NSLog(@"distance: %f", distance/100000);

    self.backgroundColor = [UIColor colorWithRed:0.0 green:0.2 blue:0.5 alpha:distance/10000];
    
    
//    NSLog(@"########Touch Down X = %d, Y = %d", curX, curY);

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch	*touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    
    int downX = location.x;
    int downY = location.y;
    
    NSLog(@"GgggggggTouch Down X = %d, Y = %d", downX, downY);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
