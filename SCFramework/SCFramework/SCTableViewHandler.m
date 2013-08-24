//
//  SCTableViewHandler.m
//  SCFramework
//
//  Created by Simon CORSIN on 8/14/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "SCTableViewHandler.h"

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
    return [super addSection];
}

- (id<SCDataModelDisplayer>) dequeueDataModelDisplayerForIdentifier:(NSString *)identifier {
    return [_tableView dequeueReusableCellWithIdentifier:identifier];
}

- (void) setTableView:(UITableView *)tableView {
    if (_tableView != nil) {
        _tableView.delegate = nil;
    }
    
    _tableView = tableView;
    
    if (_tableView != nil) {
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
}

- (SCSection*) createSection {
    return [[SCTableViewSection alloc] init];
}

- (UITableView*) tableView {
    return _tableView;
}

@end
