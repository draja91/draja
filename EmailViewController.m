//
//  EmailViewController.m
//  RecipeApp1
//
//  Created by Dharini on 14/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController
@synthesize toAdd, recipeforEmail, mailvc;
- (void)viewDidLoad {
    [super viewDidLoad];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendEmail:(UIButton *)sender {
    mailvc = [[MFMailComposeViewController alloc] init];
    mailvc.mailComposeDelegate = self;
    NSString *subject = @"Hey! Check out this recipe";
    
    NSString *name = [recipeforEmail objectForKey:@"recipename"];
    NSString *c = [recipeforEmail objectForKey:@"cuisine"];
    NSString *ingm = [recipeforEmail objectForKey:@"ingredient1"];
    NSString *ingr = [recipeforEmail objectForKey:@"ingredientsrest"];
    NSString *stps = [recipeforEmail objectForKey:@"description"];
    
    NSString *emailBody = [NSString stringWithFormat:@" <br /> <h3> '%@' </h3> <br /><h5>Cusine: '%@'   </h5><br /><h5> Main Ingredient: '%@' </h5><br /><h5> Other Ingredients: '%@' </h5><br /><br /><h5>Steps: <br/><p> '%@' </p> <br /><br /> <h5>Sent through Recipe App! Enjoy!", name,c, ingm, ingr, stps];
    NSArray *to = [NSArray arrayWithObject:toAdd.text];
    [mailvc setToRecipients:to];
    [mailvc setSubject:subject];
    [mailvc setMessageBody:emailBody isHTML:YES];
    [self presentModalViewController:mailvc animated:YES];
    
    
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.navigationController popViewControllerAnimated:YES];
        NSLog(@"Mail sent successfully!");
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
