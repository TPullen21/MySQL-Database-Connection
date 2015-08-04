//
//  AddLocationViewController.m
//  MySQL Database Connection
//
//  Created by Tom Pullen on 04/08/2015.
//  Copyright (c) 2015 Tom Pullen. All rights reserved.
//

#import "AddLocationViewController.h"
#import "HomeModel.h"

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
    
    HomeModel *homeModel = [[HomeModel alloc] init];
    [homeModel uploadlocation];
    
    
}
@end
