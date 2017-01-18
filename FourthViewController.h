//
//  FourthViewController.h
//  RecipeApp1
//
//  Created by Dharini on 15/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FourthViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIWebView *webView2;
@property (weak, nonatomic) IBOutlet UIWebView *webView3;
@property (strong, nonatomic)  PFObject *re;
@property (weak, nonatomic) IBOutlet UIView *contentView;
- (IBAction)recipeliked:(id)sender;
- (IBAction)cuisineLiked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end
