//
//  DetailViewController.h
//  RecipeApp1
//
//  Created by Dharini on 12/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Recipe.h"


@class Recipe;
@interface DetailViewController : UIViewController
@property (retain, nonatomic) PFObject *recipe;
@property (retain, nonatomic) NSString *recName;
@property (weak, nonatomic) IBOutlet UILabel *drtitle;

@property (weak, nonatomic) IBOutlet UILabel *dcuisine;

@property (weak, nonatomic) IBOutlet UILabel *dmain;
@property (weak, nonatomic) IBOutlet UILabel *drest;

@property (weak, nonatomic) IBOutlet UILabel *dsteps;

- (IBAction)like:(UIButton *)sender;

- (IBAction)emailtoFriend:(UIButton *)sender;


- (IBAction)backbutton:(id)sender;
@end
