//
//  CNMSession.m
//  CoreNetworking
//
//  Created by GabrielMassana on 25/11/2015.
//  Copyright © 2015 Gabriel Massana. All rights reserved.
//

#import "CNMSession.h"

#import "CNMRequest.h"
#import "CNMURLSessionDataTask.h"

@interface CNMSession () <NSURLSessionTaskDelegate>

@property (nonatomic, copy) NSString *name;

@property (atomic, strong) NSMutableDictionary *taskContextDictionary;
@property (atomic, strong) NSURLSession *session;
@property (atomic, strong) NSOperationQueue *operationQueue;
@property (atomic, strong) dispatch_queue_t dispatchQueue;

@end

@implementation CNMSession

#pragma mark - Init

+ (instancetype __nonnull)defaultSession
{
    static CNMSession *defaultSession = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^
                  {
                      defaultSession = [[CNMSession alloc] init];
                  });
    
    return defaultSession;
}

- (instancetype)init
{
    self = [self initWithConfiguration:nil];
    
    if (self)
    {
        
    }
    
    return self;
}

- (instancetype __nonnull)initWithConfiguration:(NSURLSessionConfiguration *__nullable)configuration
{
    self = [super init];
    
    if (self)
    {
        self.name = @"CNMSession";
        
        //Setup Atomic Properties
        self.dispatchQueue = dispatch_queue_create("com.CNM.corenetworking.CNMSessionQueue", NULL);
        
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.name = [NSString stringWithFormat:@"com.CNM.corenetworking.%@-OperationQueue",
                                    self.name];
        
        self.taskContextDictionary = [[NSMutableDictionary alloc] init];
        
        [self createURLSessionWithConfiguration:configuration];
    }
    
    return self;
}

#pragma mark - CreateSession

- (void)createURLSessionWithConfiguration:(NSURLSessionConfiguration *__nullable)configuration
{
    NSURLSessionConfiguration *configurationToUse = configuration;
    
    if (!configurationToUse)
    {
        configurationToUse = [NSURLSessionConfiguration defaultSessionConfiguration];
    }
    
    self.session = [NSURLSession sessionWithConfiguration:configurationToUse
                                                 delegate:self
                                            delegateQueue:self.operationQueue];
}

#pragma mark - Tasks

- (CNMURLSessionDataTask *__nonnull)dataTaskFromRequest:(CNMRequest *__nonnull)request
{
    CNMURLSessionDataTask *task = [[CNMURLSessionDataTask alloc] init];

    task.task =  [self.session dataTaskWithRequest:request
                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        task.onCompletion(data, response, error);
    }];
    
    return task;    
}

@end
