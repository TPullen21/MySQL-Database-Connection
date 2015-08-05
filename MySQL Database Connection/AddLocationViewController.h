//
//  AddLocationViewController.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 04/08/2015.
//  Copyright (c) 2015 Tom Pullen. All rights reserved.
//

#import "ViewController.h"

#define kPostURL @"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/post.php"
#define kName @"Name"
#define kAddress @"Address"
#define kLatitude @"Latitude"
#define kLongitude @"Longitude"

@interface AddLocationViewController : UIViewController

@property (strong, nonatomic) NSURLConnection *postConnection;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (strong, nonatomic) IBOutlet UITextField *addressTextField;

- (IBAction)cancelBarButtonItemPressed:(UIBarButtonItem *)sender;
- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender;


@end
