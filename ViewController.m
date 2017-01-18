//
//  ViewController.m
//  RecipeApp1
//
//  Created by Dharini on 05/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg3.jpg"]]];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)alert:(NSString*)message
title:(NSString*) title {
    // Show some greeting message
    // Creating a simple alert
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    // Creating the actions of the alert
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle your yes please button action here
                               }];
    
    [alert addAction:okButton];
    
    // Showing the alert
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
