//
//  ViewControllerDelete.h
//  Employee_Store_Find
//
//  Created by test on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewControllerDelete : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *deleteTextField;
- (IBAction)deleteButton:(id)sender;
@property(strong, nonatomic)NSString *deleteEmployeeId;
@property(strong, nonatomic)NSArray *deleteEmployeeDetails;

//-(void)deleteEmployeeID : (NSString *)deleteEmpID;
@end
