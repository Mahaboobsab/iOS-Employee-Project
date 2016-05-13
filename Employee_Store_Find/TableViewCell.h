//
//  TableViewCell.h
//  Employee_Store_Find
//
//  Created by test on 11/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *empID;
@property (weak, nonatomic) IBOutlet UILabel *empName;
@property (weak, nonatomic) IBOutlet UILabel *empGender;
@property (weak, nonatomic) IBOutlet UILabel *empSal;

@end
