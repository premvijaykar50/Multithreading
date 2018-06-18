//
//  ThirdViewController.h
//  Multithreading
//
//  Created by Felix ITs 03 on 18/06/18.
//  Copyright © 2018 prem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
@property dispatch_queue_t queue3;
@property dispatch_queue_t queue4;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView4;
- (IBAction)downloadbutton:(id)sender;

@end
