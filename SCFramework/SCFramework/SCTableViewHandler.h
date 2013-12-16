//
//  SCTableViewHandler.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/14/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SCListDataDisplayerHandlerInternal.h"
#import "SCTableViewHandler.h"

@interface SCTableViewSection : SCSection

@property (strong, nonatomic) UIView * footer;
@property (strong, nonatomic) UIView * header;

@end

@interface SCTableViewHandler : SCListDataDisplayerHandler<UITableViewDelegate, UITableViewDataSource> {
    
}

- (SCTableViewSection*) addSection;
- (SCTableViewSection*) getSectionForIndex:(NSUInteger)sectionIndex;
- (SCTableViewSection*) getSectionForTableViewSectionIndex:(NSInteger)tableViewSectionIndex;

@property (strong, nonatomic) UITableView * tableView;

@end
