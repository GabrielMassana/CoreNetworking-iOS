//
//  ViewController.m
//  CoreNetworking
//
//  Created by GabrielMassana on 21/01/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "CNMViewController.h"

#import <CoreOperation/COMOperationQueueManager.h>

#import "CNMAppDelegate.h"
#import "CNMDataOperation.h"
#import "CNMSession.h"
#import "CNMRequest.h"
#import "CNMURLSessionDataTask.h"

@interface CNMViewController ()

/**
 NSURLSession example starting the session inside an operation.
 */
- (void)callAPIWithAnOperation;

@end

@implementation CNMViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self callAPIWithAnOperation];
//    [self callAPIWithoutoperation]; // This example will freeze the app
}

#pragma mark - Example

- (void)callAPIWithAnOperation
{
    CNMDataOperation *operation = [[CNMDataOperation alloc] init];
    operation.operationQueueIdentifier = kCNMNetworkingOperationQueueTypeIdentifier;
    
    operation.onSuccess = ^(id result)
    {
        NSLog(@"result %@", result);
        NSLog(@"isMainThread %d", [NSThread currentThread].isMainThread);
    };
    
    [[COMOperationQueueManager sharedInstance] addOperation:operation];
}

- (void)callAPIWithoutoperation
{
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
            NSLog(@"result %@", json);
        }
        else
        {
            NSLog(@"error %@", error);
        }
    };
    
    [task resume];
}

@end
