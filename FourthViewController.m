//
//  FourthViewController.m
//  RecipeApp1
//
//  Created by Dharini on 15/12/16.
//  Copyright © 2016 Dharini. All rights reserved.
//

#import "FourthViewController.h"
#import "DetailViewController.h"

@class DetailViewController;

@interface FourthViewController ()

@end
NSMutableArray *rel;
NSString *b1;
NSString *b2;
@implementation FourthViewController

@synthesize contentView, scrollView, re, button1, button2;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://www.youtube.com/watch?v=Me3t6bM7cEg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    NSURL *url2 = [NSURL URLWithString:@"https://www.youtube.com/watch?v=2zjKOrRLX1k"];
    NSURLRequest *req2 = [NSURLRequest requestWithURL:url2];
    [self.webView2 loadRequest:req2];
    
    NSURL *url3 = [NSURL URLWithString:@"https://www.youtube.com/watch?v=s89ek3qn3Y4"];
    NSURLRequest *req3 = [NSURLRequest requestWithURL:url3];
    [self.webView3 loadRequest:req3];
    
    [self fetchMostLiked];
    
    
  
    [self.contentView setNeedsDisplay];


}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchMostLiked {
   
    PFQuery *query = [PFQuery queryWithClassName:@"Recipe"];
    [query orderByDescending:@"likes"]; query.limit=1;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if(!error){
            NSLog(@"Retrieved most liked");
            NSLog(@"objects count %lu", (unsigned long)objects.count);
        for(PFObject *ob in objects){
            re = ob;
            [button1 setTitle:[ob objectForKey:@"recipename"] forState:UIControlStateNormal];
            [button2 setTitle:[ob objectForKey:@"cuisine"] forState:UIControlStateNormal];
        }
            NSLog(@"count of rel %lu", (unsigned long)rel.count);
        }else{
            NSLog(@"%@", error);
        }
    }];
   
    
    
    
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"mostLiked"]){
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        controller.recipe = re;
    }

}


- (IBAction)recipeliked:(id)sender {
}

- (IBAction)cuisineLiked:(id)sender {
}
@end
