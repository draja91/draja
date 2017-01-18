//
//  ThirdTableViewController.m
//  RecipeApp1
//
//  Created by Dharini on 14/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "ThirdTableViewController.h"
#import "DetailViewController.h"

@interface ThirdTableViewController ()

@end

@implementation ThirdTableViewController
@synthesize list, searchResult, tableViewObject, searchController;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchAllRecipes];
    
    self.tableViewObject.dataSource = self;
    self.tableViewObject.delegate = self;
    UINavigationController *searchResultsController = [[self storyboard] instantiateViewControllerWithIdentifier:@"TableSearchResult"];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    self.tableViewObject.tableHeaderView = self.searchController.searchBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) updateSearchResultsForSearchController: (UISearchController *)searchController {
    
    NSString *searchString = self.searchController.searchBar.text;
    [self updateFilteredContent:searchString];
    
    if(self.searchController.searchResultsController) {
        UINavigationController *navController = (UINavigationController *)self.searchController.searchResultsController;
        ThirdTableViewController *tc = ([[ThirdTableViewController alloc]init]);
        tc.list = self.searchResult;
        
        [tc.tableViewObject reloadData];
    }
}

-(void)updateFilteredContent: (NSString *)searchRecipe {
    if(searchRecipe == nil){
        self.searchResult = [self.list mutableCopy];
        
    }else {
        NSMutableArray *searchResults1 = [[NSMutableArray alloc] init];
        
        for(PFObject *r in list){
            NSString *t = [r objectForKey:@"recipename"];
            if([t.lowercaseString containsString:searchRecipe.lowercaseString]){
                [searchResults1 addObject:r];
            }
            self.searchResult = searchResults1;
        }
    }
}



- (void)fetchAllRecipes {
    list = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Recipe"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if(!error){
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *obj in objects) {
                [list addObject:obj];
            }
            [self.tableView reloadData];

        }else{
            NSLog(@"Didnt work!");
        }
    }];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"reuse"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        NSString *rname = cell.textLabel.text;
        
        for(PFObject *r in list){
            if([[r objectForKey:@"recipename"] isEqualToString:rname]){
                controller.recipe = r;
            }
        }
        
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"detail";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.detailTextLabel.numberOfLines = 0;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    PFObject *recipe;
    recipe = [self.list objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [recipe objectForKey:@"recipename"];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
