//
//  SecondViewController.h
//  RecipeApp1
//
//  Created by Dharini on 07/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MasterTableViewController.h"
@class MasterTableViewController;

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ing1;
@property (weak, nonatomic) IBOutlet UIPickerView *scuisinePicker;

- (IBAction)search:(UIButton *)sender;
- (IBAction)list:(UIButton *)sender;
@property (strong, nonatomic) NSArray *pickerOptions;
@property PFObject *recipe;

@property MasterTableViewController *mvc;
@end
