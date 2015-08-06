//
//  HomeModel.m
//  MySQL Database Connection
//
//  Created by Tom Pullen on 28/07/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import "HomeModel.h"
#import "Location.h"

@interface HomeModel()
{
    NSMutableData *_downloadedData;
}
@end

@implementation HomeModel

- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/service.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

- (void)uploadlocation {
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

+ (void)uploadLocationUsingJSON {
    NSString *queryString = @"http://itsuite.it.brighton.ac.uk/torp10/MySQLDemo/postjson.php";
    
    NSMutableURLRequest *theRequest=[NSMutableURLRequest
                                     requestWithURL:[NSURL URLWithString:
                                                     queryString]
                                     cachePolicy:NSURLRequestUseProtocolCachePolicy
                                     timeoutInterval:60.0];
    
    NSDictionary* jsonDictionary = @{ @"Name" : @"Qwerty", @"Address" : @"Asdfgh", @"Latitude" : @"37.78", @"Longitude" : @"-122.40" } ;
    
    NSError *error;
    
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    
    [theRequest setHTTPMethod:@"POST"];
    
    [theRequest addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // should check for and handle errors here but we aren't
    [theRequest setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:theRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            //do something with error
        } else {
            NSString *responseText = [[NSString alloc] initWithData:data encoding: NSASCIIStringEncoding];
            NSLog(@"Response: %@", responseText);
            
            NSString *newLineStr = @"\n";
            responseText = [responseText stringByReplacingOccurrencesOfString:@"<br />" withString:newLineStr];
        }
    }];
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

-(void)connection:(NSConnection*)conn didReceiveResponse:(NSURLResponse *)response
{
    if (_receivedData == NULL) {
        _receivedData = [[NSMutableData alloc] init];
    }
    [_receivedData setLength:0];
    NSLog(@"didReceiveResponse: responseData length:(%d)", _receivedData.length);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_receivedData appendData:data];
}


- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Received %d bytes of data",[_receivedData length]);
    
    NSString *responseText = [[NSString alloc] initWithData:_receivedData encoding: NSASCIIStringEncoding];
    NSLog(@"Response: %@", responseText);
    
    NSString *newLineStr = @"\n";
    responseText = [responseText stringByReplacingOccurrencesOfString:@"<br />" withString:newLineStr];
    
}

//#pragma mark NSURLConnectionDataProtocol Methods
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    // Initialize the data object
//    _downloadedData = [[NSMutableData alloc] init];
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    // Append the newly downloaded data
//    [_downloadedData appendData:data];
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//    // Create an array to store the locations
//    NSMutableArray *_locations = [[NSMutableArray alloc] init];
//    
//    // Parse the JSON that came in
//    NSError *error;
//    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
//    
//    // Loop through Json objects, create question objects and add them to our questions array
//    for (int i = 0; i < jsonArray.count; i++)
//    {
//        NSDictionary *jsonElement = jsonArray[i];
//        
//        // Create a new location object and set its props to JsonElement properties
//        Location *newLocation = [[Location alloc] init];
//        newLocation.name = jsonElement[@"Name"];
//        newLocation.address = jsonElement[@"Address"];
//        newLocation.latitude = jsonElement[@"Latitude"];
//        newLocation.longitude = jsonElement[@"Longitude"];
//        
//        // Add this question to the locations array
//        [_locations addObject:newLocation];
//    }
//    
//    // Ready to notify delegate that data is ready and pass back items
//    if (self.delegate)
//    {
//        [self.delegate itemsDownloaded:_locations];
//    }
//}

@end

