//
//  SecondViewController.h
//  Multithreading
//
//  Created by Felix ITs 03 on 16/06/18.
//  Copyright © 2018 prem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property dispatch_queue_t queue1;
@property dispatch_queue_t queue2;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@property (weak, nonatomic) IBOutlet UIImageView *myImageView2;

@property UILabel *label;
- (IBAction)downloadbutton:(id)sender;

@end

