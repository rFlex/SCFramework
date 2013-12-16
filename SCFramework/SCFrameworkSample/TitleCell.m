//
//  TitleCell.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/23/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "TitleCell.h"

@implementation TitleCell

@synthesize data;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
    if (self) {
    }
	
    return self;
}

- (void) awakeFromNib {
	[self.removeButton addTarget:self action:@selector(removeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) removedButtonPressed:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) rebuildFromData {
	
}

@end
