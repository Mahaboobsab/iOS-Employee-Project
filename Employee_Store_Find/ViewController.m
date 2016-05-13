//
//  ViewController.m
//  Employee_Store_Find
//
//  Created by Mahaboobsab Nadaf on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButton:(id)sender {
    
    [self performSegueWithIdentifier:@"add" sender:self];
}

- (IBAction)findButton:(id)sender {
    
    [self performSegueWithIdentifier:@"find" sender:self];
}

- (IBAction)deleteButton:(id)sender {
    
    [self performSegueWithIdentifier:@"delete" sender:self];
}

- (IBAction)editButton:(id)sender {
    
    [self performSegueWithIdentifier:@"edit" sender:self];
}

- (IBAction)showAllEmployee:(id)sender {
    [self performSegueWithIdentifier:@"show" sender:self];
}









@end
