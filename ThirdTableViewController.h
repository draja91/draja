//
//  ThirdTableViewController.h
//  RecipeApp1
//
//  Created by Dharini on 14/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DetailViewController.h"
@class DetailViewController;
@interface ThirdTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableViewObject;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSMutableArray *list;
@property (strong) NSMutableArray *searchResult;
@property (strong) DetailViewController *dvc;
@end
