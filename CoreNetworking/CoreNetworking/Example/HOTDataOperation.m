//
//  HOTDataOperation.m
//  Hot
//
//  Created by GabrielMassana on 27/11/2015.
//  Copyright © 2015 Gabriel Massana. All rights reserved.
//

#import "HOTDataOperation.h"

#import "CNMSession.h"
#import "CNMRequest.h"
#import "CNMURLSessionDataTask.h"

@implementation HOTDataOperation

#pragma mark - Identifier

@synthesize identifier = _identifier;

- (NSString *)identifier
{
    if (!_identifier)
    {
        _identifier = [NSString stringWithFormat:@"HOTDataOperation"];
    }
    
    return _identifier;
}

#pragma mark - Start

- (void)start
{
    [super start];
    
    CNMRequest *request = [[CNMRequest alloc] init];
    request.URL = [NSURL URLWithString:@"https://unii-interview.herokuapp.com/api/v1/posts"];
    
    CNMURLSessionDataTask *task = [[CNMSession defaultSession] dataTaskFromRequest:request];
    
    task.onCompletion = ^void(NSData *data, NSURLResponse *response, NSError *error)
    {
        if (!error)
        {
            // Parse the raw JSON data.
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options: NSJSONReadingMutableContainers
                                                                   error: nil];
            
            NSLog(@"json = %ld",[json[@"posts"][@"data"] count]);
            NSLog(@"isMainThread %d", [NSThread currentThread].isMainThread);

            //Parse data here
            
            [self didSucceedWithResult:json];
        }
        else
        {
            [self didFailWithError:error];
        }
    };
    
    
    [task resume];
}




#pragma mark - Cancel

- (void)cancel
{
    [super cancel];
    
    [self didSucceedWithResult:nil];
}

@end
