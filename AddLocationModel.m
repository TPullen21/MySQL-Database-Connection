//
//  AddLocationModel.m
//  MySQL Database Connection
//
//  Created by Tom Pullen on 08/08/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import "AddLocationModel.h"

@implementation AddLocationModel

+ (void)uploadlocation {
    NSMutableURLRequest *request =
    [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/post.php"]];
    [request setHTTPMethod:@"POST"];
    NSDictionary *dictionary = @{ @"Name" : @"Qwerty", @"Address" : @"Asdfgh", @"Latitude" : @"37.78", @"Longitude" : @"-122.40" } ;
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    if (jsonData) {
        [request setHTTPBody:jsonData];
        (void)[[NSURLConnection alloc] initWithRequest:request delegate:self];
    } else {
        NSLog(@"Unable to serialize the data %@: %@", dictionary, error);
    }
}

+ (void)uploadLocationUsingJSON:(NSDictionary *)dictionary; {
    NSString *queryString = @"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/postjson.php";
    
    NSMutableURLRequest *theRequest=[NSMutableURLRequest
                                     requestWithURL:[NSURL URLWithString:
                                                     queryString]
                                     cachePolicy:NSURLRequestUseProtocolCachePolicy
                                     timeoutInterval:60.0];
    
//    NSDictionary* jsonDictionary = @{ @"Name" : @"Qwerty", @"Address" : @"Asdfgh", @"Latitude" : @"37.78", @"Longitude" : @"-122.40" } ;
    
    NSError *error;
    
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    
    [theRequest setHTTPMethod:@"POST"];
    
    [theRequest addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // should check for and handle errors here but we aren't
    [theRequest setHTTPBody:jsonData];
    
    [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:nil];
    
//    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//        if (error) {
//            NSLog(@"%@", error);
//            //do something with error
//        } else {
//            NSString *responseText = [[NSString alloc] initWithData:data encoding: NSASCIIStringEncoding];
//            NSLog(@"Response: %@", responseText);
//            
//            NSString *newLineStr = @"\n";
//            responseText = [responseText stringByReplacingOccurrencesOfString:@"<br />" withString:newLineStr];
//        }
//    }];
    //
    //    NSMutableURLRequest *request =
    //    [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/postjson.php"]];
    //
    //    NSDictionary *jsonDictionary = @{ @"Name" : @"Qwerty", @"Address" : @"Asdfgh", @"Latitude" : @"37.78", @"Longitude" : @"-122.40" } ;
    //
    //    NSError *error = nil;
    //
    //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary options:NSJSONWritingPrettyPrinted error:&error];
    //
    //    if (jsonData) {
    //        [request setHTTPMethod:@"POST"];
    //        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //        [request setHTTPBody:jsonData];
    //        (void)[[NSURLConnection alloc] initWithRequest:request delegate:self];
    //    } else {
    //        NSLog(@"Unable to serialize the data %@: %@", jsonDictionary, error);
    //    }
}

#pragma NSUrlConnectionDelegate Methods

-(void)connection:(NSConnection*)conn didReceiveResponse:(NSURLResponse *)response {
    if (_receivedData == NULL) {
        _receivedData = [[NSMutableData alloc] init];
    }
    [_receivedData setLength:0];
    NSLog(@"didReceiveResponse: responseData length:(%lu)", (unsigned long)_receivedData.length);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[_receivedData length]);
    
    NSString *responseText = [[NSString alloc] initWithData:_receivedData encoding: NSASCIIStringEncoding];
    NSLog(@"Response: %@", responseText);
    
    NSString *newLineStr = @"\n";
    responseText = [responseText stringByReplacingOccurrencesOfString:@"<br />" withString:newLineStr];
    
}

@end
