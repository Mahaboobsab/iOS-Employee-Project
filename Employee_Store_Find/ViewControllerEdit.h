//
//  ViewControllerEdit.h
//  Employee_Store_Find
//
//  Created by test on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import "ViewControllerEditUpdate.h"

@interface ViewControllerEdit : UIViewController
@property(strong, nonatomic)NSString *empIdStr;

@property (weak, nonatomic) IBOutlet UITextField *editTextField;

- (IBAction)editSaveButton:(id)sender;
@end
