//
//  TitleCell.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/23/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCFramework.h"

@interface TitleCell : UITableViewCell<SCDataModelDisplayer>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

@end
