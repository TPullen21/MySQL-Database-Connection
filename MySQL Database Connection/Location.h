//
//  Location.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 28/07/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;

@end
