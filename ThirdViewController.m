//
//  ThirdViewController.m
//  Multithreading
//
//  Created by Felix ITs 03 on 18/06/18.
//  Copyright © 2018 prem. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
//https://img.huffingtonpost.com/asset/5996c93d22000009371a69e5.jpeg?ops=scalefit_630_noupscale
//https://user-images.githubusercontent.com/883386/35498466-1375b88a-04d7-11e8-8f8e-9d202da6a6b3.jpg
- (void)viewDidLoad {
    [super viewDidLoad];
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


- (IBAction)downloadbutton:(id)sender {
    
    self.queue3=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0);
    self.queue4=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW,0);
    
    dispatch_async(self.queue3, ^{
        NSError *error;
        NSString *path=@"https://img.huffingtonpost.com/asset/5996c93d22000009371a69e5.jpeg?ops=scalefit_630_noupscale";
        NSURL *Url=[NSURL URLWithString:path];
        NSData *data=[NSData dataWithContentsOfURL:Url options:NSDataReadingMapped error:&error];
        if(data)
        {
            UIImage *image=[UIImage imageWithData:data];
            [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:NO];
        }
    });
    
    
    dispatch_async(self.queue4, ^{
        NSError *error;
        
        NSString *path=@"https://user-images.githubusercontent.com/883386/35498466-1375b88a-04d7-11e8-8f8e-9d202da6a6b3.jpg";
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
    self.myImageView3.image=myImage;
    
}
-(void)updateUI2:(UIImage *)myImage{
    self.myImageView4.image=myImage;
    
}


@end
