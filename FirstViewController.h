//
//  FirstViewController.h
//  RecipeApp1
//
//  Created by Dharini on 06/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *recipetitle;

@property (weak, nonatomic) IBOutlet UITextField *ing2;

@property (weak, nonatomic) IBOutlet UITextField *ingfull;
@property (weak, nonatomic) IBOutlet UITextView *desc;
- (IBAction)addRecipe:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *cuisinePicker;

@property (strong, nonatomic) NSArray *pickerOptions;
@property PFObject *recipe;

@end
