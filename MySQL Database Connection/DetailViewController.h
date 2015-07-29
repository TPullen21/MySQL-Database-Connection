//
//  DetailViewController.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 29/07/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ViewController.h"
#import "Location.h"

@interface DetailViewController : ViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) Location *selectedLocation;

@end
