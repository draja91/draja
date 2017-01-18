//
//  RegisterViewController.m
//  RecipeApp1
//
//  Created by Dharini on 06/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize fname, lname, uname, passw, cpassw, em;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)register:(UIButton *)sender {
    NSString *username = uname.text;
    NSString *firstname = fname.text;
    NSString *lastname = lname.text;
    NSString *password = passw.text;
    NSString *confPass = cpassw.text;
    NSString *email = em.text;
    
    
    PFUser *user = [PFUser user];
    user.username = username;
    user.password = password;
    user.email = email;
    user[@"firstname"] = firstname;
    user[@"lastname"] = lastname;
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(135, 140, 50, 50)];
    spinner.color = [UIColor blueColor];
    [spinner startAnimating];
    [self.view addSubview:spinner];
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if(!error){
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
            [self presentViewController:vc animated:YES completion:^{
                [spinner removeFromSuperview];
            }];
        }else {
         //   NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"User already exists. Try new details." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
            [alert show];
        }
    }];
}


-(void)textFieldDidEndEditing:(UITextField *)textField {
    [self trimblanks:textField.text];
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

-(void) trimblanks:(NSString *)checkString {
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *nstring = [checkString stringByTrimmingCharactersInSet:whitespace];
    if([nstring length] == 0){
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
}


-(void)emailcheck {
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([emailTest evaluateWithObject:em.text] == NO) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter Valid Email Address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return;
    }
}
@end

