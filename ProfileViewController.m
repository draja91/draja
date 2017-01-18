//
//  ProfileViewController.m
//  RecipeApp1
//
//  Created by Dharini on 14/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "ProfileViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize fname, lname, emailid, user;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [PFUser currentUser];
    fname.text = [user objectForKey:@"firstname"];
    lname.text = [user objectForKey:@"lastname"];
    emailid.text = [user objectForKey:@"email"];
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

- (IBAction)logout:(id)sender {
    [PFUser logOutInBackground];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginScreen"];
    UINavigationController *navControl = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.view.window setRootViewController:navControl];
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];
}
@end
