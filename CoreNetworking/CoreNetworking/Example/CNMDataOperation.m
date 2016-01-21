//
//  CNMDataOperation.m
//  Hot
//
//  Created by GabrielMassana on 27/11/2015.
//  Copyright © 2015 Gabriel Massana. All rights reserved.
//

#import "CNMDataOperation.h"

#import "CNMSession.h"
#import "CNMRequest.h"
#import "CNMURLSessionDataTask.h"

@implementation CNMDataOperation

#pragma mark - Identifier

@synthesize identifier = _identifier;

- (NSString *)identifier
{
    if (!_identifier)
    {
        _identifier = [NSString stringWithFormat:@"CNMDataOperation"];
    }
    
    return _identifier;
}

#pragma mark - Start

- (void)start
{
    [super start];
    
    CNMRequest *request = [[CNMRequest alloc] init];
    request.URL = [NSURL URLWithString:@"http://exampleapi.com/json"];
    
    CNMURLSessionDataTask *task = [[CNMSession defaultSession] dataTaskFromRequest:request];
    
    task.onCompletion = ^void(NSData *data, NSURLResponse *response, NSError *error)
    {
        if (!error)
        {
            // Raw data to JSON.
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options: NSJSONReadingMutableContainers
                                                                   error: nil];

            //Parse data here

            NSLog(@"isMainThread %d", [NSThread currentThread].isMainThread);
            
            //Completion
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
