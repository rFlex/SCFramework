//
//  HeaderCell.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/23/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCFramework.h"

@class HeaderCell;
@protocol HeaderCellDelegate <NSObject>
- (void) headerCellDidStartedEditing:(HeaderCell*)headerCell;
- (void) headerCell:(HeaderCell*)headerCell didRequestedAdd:(NSString*)entry;

@end

@interface HeaderCell : UITableViewCell<SCDataModelDisplayer>

@property (weak, nonatomic) id<HeaderCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end
