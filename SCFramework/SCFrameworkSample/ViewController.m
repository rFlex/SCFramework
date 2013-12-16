//
//  ViewController.m
//  SCFrameworkSample
//
//  Created by Simon CORSIN on 8/20/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "ViewController.h"
#import "TitleCell.h"
#import "HeaderCell.h"
#import "SCFramework.h"
#import "SCAMethod.h"

@interface ViewController () {
}

@property (strong, nonatomic) SCTableViewHandler * tableViewHandler;
@property (strong, nonatomic) UITapGestureRecognizer * tapGesture;
@property (strong, nonatomic) SCTableViewSection * titleSection;
@property (strong, nonatomic) SCAMethod * aMethod;

@end

@implementation ViewController

@synthesize tableViewHandler;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.aMethod = [[SCAMethod alloc] initWithTarget:self selector:@selector(thisIsATest:otherTest:hehe:)];
	
	SCAMethod * method = self.aMethod;
	
	NSLog(@"MethodAddr: %p", method);
	[self.aMethod invoke:Boxed(self.aMethod), 1, 4, nil];
	
//	[self.aMethod invoke:(__bridge void*)self.aMethod, nil];
    
//    self.tableViewHandler = [[SCTableViewHandler alloc] init];
//
//	SCTableViewSection * headerSection = [self.tableViewHandler addSection];
//	[headerSection addViewCreator:[[SCViewCreatorHandle alloc] initWithReuseIdentifier:@"HeaderCell" viewCreator:nil]];
//	[headerSection.dataSource feedWithSingleData:nil];
//	
//	self.titleSection = [self.tableViewHandler addSection];
//	[self.titleSection addViewCreator:[[SCViewCreatorHandle alloc] initWithReuseIdentifier:@"TitleCell" viewCreator:nil cellCreatedCb:^(TitleCell * titleCell, NSInteger index, NSInteger sectionIndex) {		
//	}]];
//	
//	SCTableViewSection * footerSection = [self.tableViewHandler addSection];
//	[footerSection addViewCreator:[[SCViewCreatorHandle alloc] initWithReuseIdentifier:@"FooterCell"]];
//	[footerSection.dataSource feedWithSingleData:nil];
//    
//    self.tableViewHandler.tableView = self.tableView;
//	
//	self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureChanged:)];
//	self.tapGesture.enabled = NO;
//	
//	[self.view addGestureRecognizer:self.tapGesture];
}

- (void) thisIsATest:(SCAMethod*)method otherTest:(NSInteger)index hehe:(NSInteger)hoho {
	NSLog(@"This is a test:%d %d", index, hoho);
	NSLog(@"Method: %@", method);
}

- (void) tapGestureChanged:(UITapGestureRecognizer*)tapGesture {
	[self.view endEditing:YES];
}

- (void) removeCell {
	
}

- (void) headerCell:(HeaderCell *)headerCell didRequestedAdd:(NSString *)entry {
	
}

- (void) headerCellDidStartedEditing:(HeaderCell *)headerCell {
	
}

- (void) addEntry:(NSString*)entry {
	[self.titleSection.dataSource feedWithSingleData:entry];
}


@end
