//
//  ViewControllerGet.h
//  Employee_Store_Find
//
//  Created by Mahaboobsab Nadaf on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerDisplay.h"
#import "ViewControllerDelete.h"

@interface ViewControllerGet : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *employeeIDfield;
@property(strong, nonatomic)NSString *employeeIDstr;
- (IBAction)getDetailsButton:(id)sender;

@end
