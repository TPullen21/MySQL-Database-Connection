//
//  AddLocationViewController.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 04/08/2015.
//  Copyright (c) 2015 Tom Pullen. All rights reserved.
//

#import "ViewController.h"

@interface AddLocationViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

- (IBAction)cancelBarButtonItemPressed:(UIBarButtonItem *)sender;
- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender;


@end
