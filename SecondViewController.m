//
//  SecondViewController.m
//  RecipeApp1
//
//  Created by Dharini on 07/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "SecondViewController.h"
#import <Parse/Parse.h>
@interface SecondViewController ()

@end
NSString *cuisineStr;
NSArray *objects;
@implementation SecondViewController
@synthesize ing1, scuisinePicker, recipe, pickerOptions, mvc;
- (void)viewDidLoad {
    [super viewDidLoad];
    scuisinePicker.delegate = self;
    scuisinePicker.dataSource = self;
    
    pickerOptions = @[@"Chinese", @"Thai", @"Indian", @"Cuban", @"Meditteranean", @"Mexican", @"American", @"Season/Holiday", @"Korean"];
    
   // [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *cuisinePicked = [pickerOptions objectAtIndex:row];
    
    cuisineStr = cuisinePicked;
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

- (IBAction)search:(UIButton *)sender {
    NSString *item1 = ing1.text;
    objects = [[NSArray alloc]init];
    PFQuery *query1 = [PFQuery queryWithClassName:@"Recipe"];
    [query1 whereKey:@"cuisine" equalTo:cuisineStr];
    PFQuery *query2 = [PFQuery queryWithClassName:@"Recipe"];
    [query2 whereKey:@"ingredient1" equalTo:item1];
    
    PFQuery *query = [PFQuery orQueryWithSubqueries:@[query1, query2]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error)
    {
        if(!error){
            NSLog(@"Successfully retrieved %lu recipes ",(unsigned long)results.count);
            objects = results;
            for (PFObject *re in results) {
                NSLog(@"%@", re.objectId);
            }
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erroe"
                                                            message:@"Recipe was not found!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        
            
        }
    }];
    
}

- (IBAction)list:(UIButton *)sender {
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([[segue identifier] isEqualToString:@"searchRecipes"]){
       UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        mvc = [navController topViewController];
        mvc.displayObjects = objects;
    }
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
