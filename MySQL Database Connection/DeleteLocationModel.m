//
//  DeleteLocationModel.m
//  MySQL Database Connection
//
//  Created by Tom Pullen on 09/08/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import "DeleteLocationModel.h"

@implementation DeleteLocationModel

+ (void)deleteLocationUsingJSON:(NSDictionary *)dictionary; {
    
    NSMutableURLRequest *theRequest=[NSMutableURLRequest
                                     requestWithURL:[NSURL URLWithString:
                                                     kDeleteLocationURL]
                                     cachePolicy:NSURLRequestUseProtocolCachePolicy
                                     timeoutInterval:60.0];
    
    NSError *error;
    
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
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
