//
//  SCTableViewHandler.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/14/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCTableViewHandler.h"
#import "SCDataSourceHandle.h"

////////////////////////////////////////////////////////////
// PRIVATE DEFINITION
/////////////////////

@interface SCTableViewHandler() {
    UITableView * _tableView;
}

@end

////////////////////////////////////////////////////////////
// IMPLEMENTATION
/////////////////////

@implementation SCTableViewSection

@synthesize footer;
@synthesize header;

@end

@implementation SCTableViewHandler

- (id) init {
    self = [super init];
    
    if (self) {
        _tableView = nil;
    }
    
    return self;
}

- (SCTableViewSection*) addSection {
    return (SCTableViewSection*)[super addSection];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	NSInteger virtualSectionCount = 0;
	
	for (NSUInteger i = 0; i < self.sections.count; i++) {
		if ([self getSectionForIndex:i].enabled) {
			virtualSectionCount++;
		}
	}
	
	return virtualSectionCount;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
	SCSection * section = [self getSectionForTableViewSectionIndex:sectionIndex];
	id<SCDataSet> dataSet = section.dataSource.dataSet;
	NSInteger count = dataSet.count;
	
	if (!section.dataSource.dataSetIsComplete) {
		count++;
	}
	
	return count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	SCSection * section = [self getSectionForTableViewSectionIndex:indexPath.section];
	
	return (UITableViewCell*)[self createDataModelDisplayerAtIndex:indexPath.row forSection:section];
}

- (id<SCDataModelDisplayer>) dequeueDataModelDisplayerForIdentifier:(NSString *)identifier {
    return [_tableView dequeueReusableCellWithIdentifier:identifier];
}

- (SCTableViewSection*) getSectionForIndex:(NSUInteger)sectionIndex {
	return (SCTableViewSection*)[super getSectionForIndex:sectionIndex];
}

- (SCTableViewSection*) getSectionForTableViewSectionIndex:(NSInteger)tableViewSectionIndex {
	NSUInteger virtualSectionIndex = -1;
	NSUInteger realSectionIndex = -1;
	
	while (virtualSectionIndex != tableViewSectionIndex) {
		realSectionIndex++;
		
		SCTableViewSection * section = [self getSectionForIndex:realSectionIndex];
		if (section.enabled) {
			virtualSectionIndex++;
		}
	}
	
	return [self getSectionForIndex:realSectionIndex];
}

- (void) setTableView:(UITableView *)tableView {
    if (_tableView != nil) {
        _tableView.delegate = nil;
		_tableView.dataSource = nil;
    }
    
    _tableView = tableView;
    
    if (_tableView != nil) {
        _tableView.delegate = self;
        _tableView.dataSource = self;
		[_tableView reloadData];
    }
}

- (SCSection*) createSection {
    return [[SCTableViewSection alloc] init];
}

- (UITableView*) tableView {
    return _tableView;
}

@end
