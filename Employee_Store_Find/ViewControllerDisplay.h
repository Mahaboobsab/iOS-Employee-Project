//
//  ViewControllerDisplay.h
//  Employee_Store_Find
//
//  Created by Mahaboobsab Nadaf on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ViewControllerGet.h"
#import "AppDelegate.h"

@interface ViewControllerDisplay : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *employeeID;

@property (weak, nonatomic) IBOutlet UILabel *employeeName;
@property (weak, nonatomic) IBOutlet UILabel *employeeGender;

@property (weak, nonatomic) IBOutlet UILabel *employeeSal;

@property(strong, nonatomic)NSString *employeeId;
@property(strong, nonatomic)NSArray *employeeDetails;

-(void)getEmployeeID : (NSString *)empID;
@end
