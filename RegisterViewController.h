//
//  RegisterViewController.h
//  RecipeApp1
//
//  Created by Dharini on 06/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fname;
@property (weak, nonatomic) IBOutlet UITextField *lname;
@property (weak, nonatomic) IBOutlet UITextField *uname;
@property (weak, nonatomic) IBOutlet UITextField *passw;
@property (weak, nonatomic) IBOutlet UITextField *cpassw;
//@property (weak, nonatomic) IBOutlet UITextField *remail;
@property (weak, nonatomic) IBOutlet UITextField *em;

- (IBAction)register:(UIButton *)sender;
@end
