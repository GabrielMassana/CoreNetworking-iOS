//
//  AppDelegate.m
//  CoreNetworking
//
//  Created by GabrielMassana on 21/01/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "CNMAppDelegate.h"

#import "COMOperationQueueManager.h"

NSString *const kCNMNetworkingOperationQueueTypeIdentifier = @"kCNMNetworkingOperationQueueTypeIdentifier";

@interface CNMAppDelegate ()

@end

@implementation CNMAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self registerOperationQueues];

    return YES;
}

#pragma mark - OperationQueues

- (void)registerOperationQueues
{
    //Network UI
    
    //Network Background
    NSOperationQueue *networkDataOperationQueue = [[NSOperationQueue alloc] init];
    networkDataOperationQueue.qualityOfService = NSQualityOfServiceBackground;
    networkDataOperationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    
    [[COMOperationQueueManager sharedInstance] registerOperationQueue:networkDataOperationQueue
                                             operationQueueIdentifier:kCNMNetworkingOperationQueueTypeIdentifier];
    
    //Media Download
    
    //Core Data Update
}

@end
