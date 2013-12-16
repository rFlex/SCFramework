//
//  HeaderCell.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/23/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

@synthesize data;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) dealloc {
	NSLog(@"Dealloc?");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) awakeFromNib {
	[super awakeFromNib];
	
	[self.textField addTarget:self action:@selector(textFieldStarted:) forControlEvents:UIControlEventEditingDidBegin];
	
	[self.textField addTarget:self action:@selector(textFieldEnded:) forControlEvents:UIControlEventEditingDidEnd];
	
}

- (void) textFieldEnded:(UITextField*)textField {
	if ([self.delegate respondsToSelector:@selector(headerCell:didRequestedAdd:)]) {
		[self.delegate headerCell:self didRequestedAdd:textField.text];
	}
}

- (void) textFieldStarted:(id)sender {
	if ([self.delegate respondsToSelector:@selector(headerCellDidStartedEditing:)]) {
		[self.delegate headerCellDidStartedEditing:self];
	}
}

- (void) prepareForReuse {
	[super prepareForReuse];
}

- (void) rebuildFromData {
	
}



@end
