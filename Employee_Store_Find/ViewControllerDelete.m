//
//  ViewControllerDelete.m
//  Employee_Store_Find
//
//  Created by test on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewControllerDelete.h"

@interface ViewControllerDelete ()

@end

@implementation ViewControllerDelete

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)deleteButton:(id)sender {
    
    self.deleteEmployeeId = self.deleteTextField.text;
    
    NSManagedObjectContext *context = [self getTheContext];
    
    NSFetchRequest *fetchReq = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(empid = %@)",self.deleteEmployeeId];
    
    [fetchReq setPredicate:predicate];
    
    
    NSManagedObject *deleteTheObject = nil;
    
   self.deleteEmployeeDetails = [context executeFetchRequest:fetchReq error:&error];
    
    
    
    if ([self.deleteEmployeeDetails count] == 0) {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Error in Deleting Details"
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  
                                                                  
                                                                   [self dismissViewControllerAnimated:YES completion:nil];
                                                                  
                                                              }];
        
        
        [alertController addAction:defaultAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
   

        NSLog(@"No data available");
    }
    
    else{
    
        deleteTheObject = [self.deleteEmployeeDetails objectAtIndex:0];
        
        [context deleteObject:deleteTheObject];
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Employee Details removed Successfilly"
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  
                                                                  
                                                                   [self dismissViewControllerAnimated:YES completion:nil];
                                                                  
                                                              }];
        
        
        [alertController addAction:defaultAction];
        [self presentViewController:alertController animated:YES completion:nil];

        
        
    
    }
    
    if (![context save:&error]) {
        
        
        
        
        
             NSLog(@"Error in Deleting");
        
        
        
        
    }
    else{
    
        
        
        NSLog(@"Employee Deleted Successfully");
    }
    
    
}

-(NSManagedObjectContext *)getTheContext{

    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    return context;
}
@end
