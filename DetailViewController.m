//
//  DetailViewController.m
//  RecipeApp1
//
//  Created by Dharini on 12/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "DetailViewController.h"
#import <Parse/Parse.h>
#import "Recipe.h"
#import "EmailViewController.h"


@class Recipe;
@interface DetailViewController ()


@end
Recipe *r;

@implementation DetailViewController
@synthesize recipe, dmain, drest, dsteps, drtitle, dcuisine, recName;
- (void)viewDidLoad {
   
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    drtitle.text = [recipe objectForKey:@"recipename"];
    dcuisine.text = [recipe objectForKey:@"cuisine"];
    dmain.text = [recipe objectForKey:@"ingredient1"];
    drest.text = [recipe objectForKey:@"ingredientsrest"];
    dsteps.text = [recipe objectForKey:@"description"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)like:(UIButton *)sender {
    UIImage * unselectedImage= [UIImage imageNamed:@"Like-icon.png"];
    UIImage * selectedImage = [UIImage imageNamed:@"like.png"];
    
    if ([sender isSelected]) {
        [sender setImage:unselectedImage forState:UIControlStateNormal];
        [sender setSelected:NO];
    } else {
        [sender setImage:selectedImage forState:UIControlStateSelected];
        [sender setSelected:YES];
    }
    
   
    [recipe incrementKey:@"likes"];
    [recipe saveInBackground];
}

- (IBAction)emailtoFriend:(UIButton *)sender {
}

- (IBAction)backbutton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



 //sIn a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"emailFriend"]){
        EmailViewController *evc = (EmailViewController *)[segue destinationViewController];
        evc.navigationItem.leftItemsSupplementBackButton = YES;
        evc.recipeforEmail = recipe;
        
    }
  
}


@end
