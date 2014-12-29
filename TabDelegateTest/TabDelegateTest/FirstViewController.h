//
//  FirstViewController.h
//  TabDelegateTest
//
//  Created by Yurim Jin on 2014. 12. 29..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITabBarControllerDelegate>

@property (strong, nonatomic) NSMutableArray *firstMutable;

@end

