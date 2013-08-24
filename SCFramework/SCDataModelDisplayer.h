//
//  SCDataModelDisplayer.h
//  SCFramework
//
//  Created by Simon CORSIN on 8/9/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SCDataModelDisplayer <NSObject>

- (void) rebuildFromData;

@property (strong, nonatomic) id data;

@end
