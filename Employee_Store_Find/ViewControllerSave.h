//
//  ViewControllerSave.h
//  Employee_Store_Find
//
//  Created by Mahaboobsab Nadaf on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewControllerSave : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *empID;
@property (weak, nonatomic) IBOutlet UITextField *empName;
@property (weak, nonatomic) IBOutlet UITextField *empGender;

@property (weak, nonatomic) IBOutlet UITextField *empSalary;
- (IBAction)empSave:(id)sender;


@end
