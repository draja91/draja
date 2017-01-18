//
//  ProfileViewController.h
//  RecipeApp1
//
//  Created by Dharini on 14/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ProfileViewController : UIViewController
- (IBAction)logout:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *fname;
@property (weak, nonatomic) IBOutlet UILabel *lname;
@property (weak, nonatomic) IBOutlet UILabel *emailid;
@property (strong, nonatomic) PFUser *user;
@end
