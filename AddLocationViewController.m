//
//  AddLocationViewController.m
//  MySQL Database Connection
//
//  Created by Tom Pullen on 08/08/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import "AddLocationViewController.h"
#import "AddLocationModel.h"

@interface AddLocationViewController ()

@end

@implementation AddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */

- (IBAction)cancelBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender {
    NSLog(@"Save button pressed!!");
    
    NSDictionary* jsonDictionary = @{ kName : self.nameTextField.text,
                                      kAddress : self.addressTextField.text,
                                      kLatitude : self.latitudeTextField.text,
                                      kLongitude : self.longitudeTextField.text
                                    };
    
    [AddLocationModel uploadLocationUsingJSON:jsonDictionary];
    
    [self didAddLocation];
    
    //    [self addLocation:self.nameTextField.text withAddress:self.addressTextField.text latitude:self.latitudeTextField.text longitude:self.longitudeTextField.text];
    
    //    HomeModel *homeModel = [[HomeModel alloc] init];
    //    [homeModel uploadlocation];
    
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (void)addLocation:(NSString *)name withAddress:(NSString *)address latitude:(NSString *)latitude longitude:(NSString *)longitude  {
    
    if (name != nil && address != nil && latitude != nil && longitude != nil) {
        
        NSMutableString *postString = [NSMutableString stringWithString:kPostURL];
        
        [postString appendString:[NSString stringWithFormat:@"?%@=%@&%@=%@&%@=%@&%@=%@", kName, name, kAddress, address, kLatitude, latitude, kLongitude, longitude]];
        
        [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
        
        [request setHTTPMethod:@"POST"];
        
        self.postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
        
    }
    
}

- (void)didAddLocation; {
    
    [self.delegate addLocation:self.nameTextField.text Address:self.addressTextField.text latitude:self.latitudeTextField.text longitude:self.longitudeTextField.text];
}

@end
