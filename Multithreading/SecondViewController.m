//
//  SecondViewController.m
//  Multithreading
//
//  Created by Felix ITs 03 on 16/06/18.
//  Copyright © 2018 prem. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)downloadbutton:(id)sender {
    
    self.queue1=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0);
    self.queue2=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW,0);
    
    dispatch_async(self.queue1, ^{
        NSError *error;
        NSString *path=@"https://images.pexels.com/photos/949586/pexels-photo-949586.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
        NSURL *Url=[NSURL URLWithString:path];
        NSData *data=[NSData dataWithContentsOfURL:Url options:NSDataReadingMapped error:&error];
        if(data)
        {
            UIImage *image=[UIImage imageWithData:data];
            [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:NO];
        }
    });
    
    
    dispatch_async(self.queue2, ^{
        NSError *error;
        NSString *path=@"https://images.pexels.com/photos/257840/pexels-photo-257840.jpeg?auto=compress&cs=tinysrgb&h=350";
        NSURL *Url=[NSURL URLWithString:path];
        NSData *data=[NSData dataWithContentsOfURL:Url options:NSDataReadingMapped error:&error];
        if(data)
        {
            UIImage *image=[UIImage imageWithData:data];
            [self performSelectorOnMainThread:@selector(updateUI2:) withObject:image waitUntilDone:NO];
        }
    });
    
}
-(void)updateUI:(UIImage *)myImage{
    self.myImageView.image=myImage;
    
}
-(void)updateUI2:(UIImage *)myImage{
    self.myImageView2.image=myImage;
    
}
@end
