//
//  AddLocationViewController.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 08/08/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPostURL @"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/post.php"
#define kName @"Name"
#define kAddress @"Address"
#define kLatitude @"Latitude"
#define kLongitude @"Longitude"

@protocol AddLocationViewControllerDelegate <NSObject>

- (void)didAddLocation;

@end

@interface AddLocationViewController : UIViewController

@property (strong, nonatomic) NSURLConnection *postConnection;

@property (weak, nonatomic) id <AddLocationViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *addressTextField;
@property (strong, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (strong, nonatomic) IBOutlet UITextField *longitudeTextField;

- (IBAction)cancelBarButtonItemPressed:(UIBarButtonItem *)sender;
- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender;


@end
