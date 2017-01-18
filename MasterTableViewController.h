//
//  MasterTableViewController.h
//  RecipeApp1
//
//  Created by Dharini on 11/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
#import "DetailViewController.h"

@class DetailViewController;
@class Recipe;

@interface MasterTableViewController : UITableViewController
@property (retain) DetailViewController *detailViewController;
@property Recipe *recipe;
@property UITableView *tv;

@property NSArray *displayObjects;
@end
