//
//  ViewControllerEdit.m
//  Employee_Store_Find
//
//  Created by test on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewControllerEdit.h"

@interface ViewControllerEdit ()

@end

@implementation ViewControllerEdit

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.empIdStr = [[NSString alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)editSaveButton:(id)sender {
    

    
 self.empIdStr = self.editTextField.text;
   
    
    
    
    
    NSManagedObjectContext *context = [self getContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(empid = %@)",
                         self.empIdStr];
    [fetchRequest setPredicate:pred];
    // NSManagedObject *matches = nil;
    
    NSArray *objects = [context executeFetchRequest:fetchRequest error:&error];
    if ([objects count] == 0) {
        
        
        
        
        [self callAlert];
        
        
        
        NSLog(@"No objects");
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        
         [self performSegueWithIdentifier:@"edit2" sender:self];
        
    }


}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 ViewControllerEditUpdate *editUpdate = [segue destinationViewController];
    
    [editUpdate getEditID:self.empIdStr];
    

}



-(NSManagedObjectContext *)getContext{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    
    return context;
    
}


-(void)callAlert{
    
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid EmployeeID"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          
                                                          
                                                              
                                                          
                                                          
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
@end
