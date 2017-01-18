//
//  FirstViewController.m
//  RecipeApp1
//
//  Created by Dharini on 06/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "FirstViewController.h"
#import <Parse/Parse.h>
@interface FirstViewController ()

@end
NSString *cuisineString;
@implementation FirstViewController
@synthesize recipe;
@synthesize recipetitle, ing2, ingfull, desc, cuisinePicker, pickerOptions;
- (void)viewDidLoad {
    recipe = [PFObject objectWithClassName:@"Recipe"];
    
    [super viewDidLoad];
    
    desc.delegate=self;
    
    
    
    cuisinePicker.delegate=self;
    cuisinePicker.dataSource=self;
    
    pickerOptions = @[@"Chinese", @"Thai", @"Indian", @"Cuban", @"Meditteranean", @"Mexican", @"American", @"Season/Holiday", @"Korean"];
  //  [self.view endEditing:YES];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void) textViewDidBeginEditing:(UITextView *) textView {
    [textView setText:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *cuisinePicked = [pickerOptions objectAtIndex:row];
    
    cuisineString = cuisinePicked;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return pickerOptions.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return pickerOptions[row];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addRecipe:(UIButton *)sender {
    PFUser *currentUser = [PFUser currentUser];

    
    NSString *recipeName = recipetitle.text;
    
    NSString *ingr = ing2.text;
    NSString *ingrf = ingfull.text;
    NSString *steps = desc.text;
    NSString *userId = [currentUser objectId];
    
    
    recipe[@"recipename"] = recipeName;
    recipe[@"ingredient1"] = ingr;
    recipe[@"cuisine"] = cuisineString;
    
    recipe[@"ingredientsrest"] = ingrf;
    recipe[@"description"] = steps;
    recipe[@"userid"] = userId;
    recipe[@"likes"] = @1;
    
    [recipe saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if(succeeded){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                            message:@"Recipe Added!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erroe"
                                                            message:@"Recipe was not added!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if([self returnWithoutWhiteSpaces:textField.text] !=nil){
        UIResponder *newResponder = [textField.superview viewWithTag:textField.tag+1];
        if(newResponder) {
            [newResponder becomeFirstResponder];
        }else {
            [textField resignFirstResponder];
        }
    }else {
        [textField becomeFirstResponder];
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
}

-(NSString *) returnWithoutWhiteSpaces:(NSString *)myString {
    NSString *newString = [myString stringByReplacingOccurrencesOfString:@"\u200B" withString:@""];
    return newString;
    
}
@end
