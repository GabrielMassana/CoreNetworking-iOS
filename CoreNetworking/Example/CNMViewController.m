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
@end
