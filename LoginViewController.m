//
//  LoginViewController.m
//  RecipeApp1
//
//  Created by Dharini on 06/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>



@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize  username, password;
- (void)viewDidLoad {
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bkg-9.jpg"]]];
  
    [super viewDidLoad];
    

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)login:(UIButton *)sender {
  //  PFObject *testUser = [PFObject objectWithClassName:@"User"];
    NSString* usern = [self.username text];
    NSString* passw = [self.password text];
    
    [PFUser logInWithUsernameInBackground:usern password:passw
                                    block:^(PFUser *user, NSError *error) {
                                        if(user) {
                                            // Checking out if the email has been verified
                                            
                                                //[self alert:@"Welcome back" title:@"Login"];
                                                [self redirectToHome];
                                            }
                                            
                                         else {
                                            NSString* errorString = [error userInfo][@"error"];
                                            [self alert:errorString title:@"Error"];
                                        }
                                    }];
}

- (IBAction)loginfb:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if(! error){
            [self redirectToHome];
        }else if(result.isCancelled){
            NSLog(@"Login cancelled");
        }
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) redirectToHome {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"HomeScreen"];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

-(void) loadDataFromFB {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error){
        if(!error) {
            
            PFUser *user = [PFUser currentUser];
            
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            NSString *name = userData[@"name"];
//            NSString *location = userData[@"location"][@"name"];
//            NSString *gender = userData[@"gender"];
//            NSString *birthday = userData[@"birthday"];
//            NSString *relationship = userData[@"relationship_status"];
            
           // NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
           // NSURLRequest *urlRequest = [NSURLRequest requestWithURL:pictureURL];
            
            user[@"firstname"]=name;
            user[@""] = @"";
            
            [self redirectToHome];
        }}];
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
