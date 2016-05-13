//
//  ViewControllerEditUpdate.m
//  Employee_Store_Find
//
//  Created by test on 11/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewControllerEditUpdate.h"

@interface ViewControllerEditUpdate ()

@end

@implementation ViewControllerEditUpdate{

    NSManagedObject *editObject;
}

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
        
        
        
       
        
        
        
        
        NSLog(@"No objects");
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        matches = [objects objectAtIndex:0];
        
        self.empName.text = [NSString stringWithFormat:@"%@", [matches valueForKey:@"empname"]];
        
        self.empID.text = [NSString stringWithFormat:@"%@", [matches valueForKey:@"empid"]];
        
        self.empGender.text = [NSString stringWithFormat:@"%@", [matches valueForKey:@"empgender"]];
        
        NSString *tempSal = [matches valueForKey:@"empsalary"];
        
        
        self.empSalary.text = [NSString stringWithFormat:@"%@",tempSal];
        
        
        
        
    }

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







- (IBAction)saveButton:(id)sender {
    
    
    
    
    
    
        NSManagedObjectContext *context = [self getContext];
    
        editObject = nil;
        NSError *error = nil;
    
        NSFetchRequest *fetchReqst = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(empid = %@)",self.employeeId];
        [fetchReqst setPredicate:predicate ];
    
        self.detailObject = [context executeFetchRequest:fetchReqst error:&error];
        editObject = [self.detailObject objectAtIndex:0];
    

    
    
    
    [editObject setValue:self.empID.text forKey:@"empid"];
    [editObject setValue:self.empName.text forKey:@"empname"];
    [editObject setValue:self.empGender.text forKey:@"empgender"];
    
    [editObject setValue:[NSNumber numberWithFloat:self.empSalary.text.floatValue] forKey:@"empsalary"];
    
    if (![context save:&error]) {
        NSLog(@"Failed Save Changes");
    }
    else{
        NSLog(@"Changes made successfully...");
    
        [self callAlert];
      
    }
    
}


-(NSManagedObjectContext *)getContext{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    
    return context;
    
}

-(void)getEditID:(NSString *)editID{

   // self.detailObject = [[NSArray alloc]init];
    self.employeeId = [[NSString alloc]init];
    self.employeeId = editID;
    
    NSLog(@"Employee id is %@",self.employeeId);
    

}

-(void)callAlert{


    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Saved the Changes"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          
                                            [self.navigationController popViewControllerAnimated:YES];               
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];

}
@end
