//
//  AddLocationViewController.m
//  MySQL Database Connection
//
//  Created by Tom Pullen on 04/08/2015.
//  Copyright (c) 2015 Tom Pullen. All rights reserved.
//

#import "AddLocationViewController.h"
#import "ViewController.h"
#import "HomeModel.h"

@interface AddLocationViewController ()

@end

@implementation AddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.nameTextField becomeFirstResponder];
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
    
    [HomeModel uploadLocationUsingJSON];
    
//    [self addLocation:self.nameTextField.text withAddress:self.addressTextField.text latitude:self.latitudeTextField.text longitude:self.longitudeTextField.text];
    
//    HomeModel *homeModel = [[HomeModel alloc] init];
//    [homeModel uploadlocation];

    if ([self.presentingViewController isKindOfClass:[ViewController class]]) {
        NSLog(@"ViewController Class");
    }
    else if ([self.presentingViewController isKindOfClass:[AddLocationViewController class]]) {
        NSLog(@"ViewController Class");
    }
    
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

@end
