//
//  FooterCell.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/23/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "FooterCell.h"

@implementation FooterCell

@synthesize data;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) rebuildFromData {
	
}

@end
