//
//  ViewControllerShow.h
//  Employee_Store_Find
//
//  Created by test on 11/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "TableViewCell.h"
#import "AppDelegate.h"
@interface ViewControllerShow : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)NSMutableArray *allEmployeeDetails;
@end
