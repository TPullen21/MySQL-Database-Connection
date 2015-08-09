//
//  ViewController.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 28/07/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "AddLocationViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol, AddLocationViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *listTableView;
- (IBAction)addBarButtonItemPressed:(UIBarButtonItem *)sender;

@end

