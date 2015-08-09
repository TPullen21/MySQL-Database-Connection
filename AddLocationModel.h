//
//  AddLocationModel.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 08/08/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAddLocationURL @"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/postjson.php"

@interface AddLocationModel : NSObject <NSURLConnectionDataDelegate>{
    NSMutableData* _receivedData;
}

+ (void)uploadlocation;
+ (void)uploadLocationUsingJSON:(NSDictionary *)dictionary;

@end
