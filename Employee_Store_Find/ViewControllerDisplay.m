//
//  ViewControllerDisplay.m
//  Employee_Store_Find
//
//  Created by Mahaboobsab Nadaf on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewControllerDisplay.h"

@interface ViewControllerDisplay ()

@end

@implementation ViewControllerDisplay

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    NSManagedObjectContext *context = [self getContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(empid = %@)",
                         self.employeeId];
    [fetchRequest setPredicate:pred];
    NSManagedObject *matches = nil;
 
    NSArray *objects = [context executeFetchRequest:fetchRequest error:&error];
    if ([objects count] == 0) {
        
        
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Employee Details not found"
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  
                                                                  
                                        [self.navigationController popViewControllerAnimated:YES];
                                                                  
                                                              }];
        
       
        [alertController addAction:defaultAction];
        [self presentViewController:alertController animated:YES completion:nil];
    
       
       
    
    
    
    
    
    
    
    
    
    
     NSLog(@"No objects");
    
    } else {
        matches = [objects objectAtIndex:0];
        
        self.employeeName.text = [NSString stringWithFormat:@"Employee Name = %@ ", [matches valueForKey:@"empname"]];
        
       self.employeeID.text = [NSString stringWithFormat:@"Employee ID = %@ ", [matches valueForKey:@"empid"]];
        
        self.employeeGender.text = [NSString stringWithFormat:@"Employee gender = %@ ", [matches valueForKey:@"empgender"]];
        
        NSString *tempSal = [matches valueForKey:@"empsalary"];
        
        
        self.employeeSal.text = [NSString stringWithFormat:@"Employee Salary = %@",tempSal];
        
     
        
    }
    
}


    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getEmployeeID:(NSString *)empID{

    self.employeeId = [[NSString alloc]init];
    self.employeeId = empID;
}


-(NSManagedObjectContext *)getContext{

    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    return context;
}
@end
