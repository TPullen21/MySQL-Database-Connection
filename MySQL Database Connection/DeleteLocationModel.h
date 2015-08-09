//
//  DeleteLocationModel.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 09/08/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDeleteLocationURL @"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/deleteLocation.php"

@interface DeleteLocationModel : NSObject <NSURLConnectionDataDelegate>{
    NSMutableData* _receivedData;
}

+ (void)deleteLocationUsingJSON:(NSDictionary *)dictionary;

@end
