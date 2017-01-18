//
//  LoginViewController.h
//  RecipeApp1
//
//  Created by Dharini on 06/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(UIButton *)sender;
;

- (IBAction)loginfb:(id)sender;

@end
