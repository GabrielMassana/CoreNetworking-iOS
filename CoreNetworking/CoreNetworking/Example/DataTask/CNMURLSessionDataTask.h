//
//  CNMURLSessionDataTask.h
//  CoreNetworking
//
//  Created by GabrielMassana on 26/11/2015.
//  Copyright © 2015 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNMURLSessionDataTask : NSObject

@property (nonatomic, copy) void(^_Nullable onCompletion)(NSData *__nullable data, NSURLResponse *__nullable response, NSError *__nullable error);

@property (nonatomic, strong) NSURLSessionDataTask *__nonnull task;

- (void)resume;

@end
