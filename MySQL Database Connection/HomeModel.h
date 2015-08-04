//
//  HomeModel.h
//  MySQL Database Connection
//
//  Created by Tom Pullen on 28/07/2015.
//  Copyright © 2015 Tom Pullen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface HomeModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeModelProtocol> delegate;

- (void)downloadItems;
- (void)uploadlocation;

@end
