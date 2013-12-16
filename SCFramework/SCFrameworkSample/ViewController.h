//
//  ViewController.h
//  SCFrameworkSample
//
//  Created by Simon CORSIN on 8/20/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCFramework.h"
#import "HeaderCell.h"

@interface ViewController : SCViewController<HeaderCellDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
