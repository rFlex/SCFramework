//
//  ViewController.m
//  SCFrameworkSample
//
//  Created by Simon CORSIN on 8/20/13.
//  Copyright (c) 2013 SCorsin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) SCTableViewHandler * tableViewHandler;

@end

@implementation ViewController

@synthesize tableViewHandler;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView * tableView = [[UITableView alloc] init];
    tableView.frame = self.view.bounds;
    
    self.view = tableView;
    
    self.tableViewHandler = [[SCTableViewHandler alloc] init];
    
    
    self.tableViewHandler.tableView = tableView;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
