//
//  ViewControllerEditUpdate.h
//  Employee_Store_Find
//
//  Created by test on 11/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerEdit.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
@interface ViewControllerEditUpdate : UIViewController
@property(strong, nonatomic)NSString *employeeId;
@property(strong, nonatomic)NSArray *employeeDetails;

@property (weak, nonatomic) IBOutlet UITextField *empID;

@property (weak, nonatomic) IBOutlet UITextField *empName;

@property (weak, nonatomic) IBOutlet UITextField *empGender;
@property (weak, nonatomic) IBOutlet UITextField *empSalary;
@property(strong, nonatomic)NSArray *detailObject;

- (IBAction)saveButton:(id)sender;

-(void)getEditID:(NSString *)editID;
@end
