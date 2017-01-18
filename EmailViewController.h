//
//  EmailViewController.h
//  RecipeApp1
//
//  Created by Dharini on 14/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <Parse/Parse.h>
@interface EmailViewController : UIViewController<MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *toAdd;
@property (strong, nonatomic)PFObject *recipeforEmail;
- (IBAction)sendEmail:(UIButton *)sender;

@property (strong, nonatomic) MFMailComposeViewController *mailvc;
@end
