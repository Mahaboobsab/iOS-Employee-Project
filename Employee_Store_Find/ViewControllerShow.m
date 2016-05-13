//
//  ViewControllerShow.m
//  Employee_Store_Find
//
//  Created by test on 11/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewControllerShow.h"

@interface ViewControllerShow ()

@end

@implementation ViewControllerShow

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    NSManagedObjectContext *context = [self getContext];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    self.allEmployeeDetails = [[NSMutableArray alloc] initWithArray:[context executeFetchRequest:fetchRequest error:&error]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.allEmployeeDetails.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSManagedObject *employeeObject = [self.allEmployeeDetails objectAtIndex:indexPath.row];
    
    cell.empID.text = [employeeObject valueForKey:@"empid"];
    cell.empName.text = [employeeObject valueForKey:@"empname"];
    cell.empGender.text = [employeeObject valueForKey:@"empgender"];
    
    NSString *sal = [NSString stringWithFormat:@"%@",[employeeObject valueForKey:@"empsalary"]];
    cell.empSal.text = sal;
    
    
    return cell;
}

-(NSManagedObjectContext *)getContext{
    
    
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context =   [appDelegate managedObjectContext];
    
    return context;
    
}

@end
