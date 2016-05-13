//
//  ViewControllerSave.m
//  Employee_Store_Find
//
//  Created by Mahaboobsab Nadaf on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewControllerSave.h"

@interface ViewControllerSave ()

@end

@implementation ViewControllerSave{

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)empSave:(id)sender {
    
    NSManagedObjectContext *context = [self getContext];
    
    NSManagedObject *employeeObject = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
    
    [employeeObject setValue:self.empName.text forKey:@"empname"];
    
    [employeeObject setValue:self.empID.text forKey:@"empid"];
    
    [employeeObject setValue:self.empGender.text forKey:@"empgender"];
    
      [employeeObject setValue:[NSNumber numberWithFloat:self.empSalary.text.floatValue] forKey:@"empsalary"];

    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Failed to Save Data");
    }
    
    else{
    
    
        NSLog(@"Data Saved Successfully");
    
    }
    
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Employee Details Saved"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    

    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              
                               [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
}













-(NSManagedObjectContext *)getContext{


    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
   NSManagedObjectContext *context  = [appDelegate managedObjectContext];
    
    return context;

}
@end
