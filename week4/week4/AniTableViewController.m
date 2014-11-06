//
//  AniTableViewController.m
//  week4
//
//  Created by Yurim Jin on 2014. 11. 6..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "AniTableViewController.h"
#import "Detail.h"

@interface AniTableViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
@property (nonatomic) BOOL presentMode;

@end

@implementation AniTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [[NSArray alloc]initWithObjects:@"가",@"나",@"다", nil];
    self.listData = array;
    self.navigationController.delegate = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Detail"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Detail"];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [_listData objectAtIndex:row];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        Detail *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
        detail.name = @"가갸거겨고교구규";
        [self.navigationController pushViewController:detail animated:YES];
    }
    
    
}

#pragma animation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *nextViewController = segue.destinationViewController;
    nextViewController.transitioningDelegate = self;
    nextViewController.modalPresentationStyle = UIModalPresentationCustom;
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
