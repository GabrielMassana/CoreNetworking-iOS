//
//  CNMURLSessionDataTask.h
//  Hot
//
//  Created by GabrielMassana on 26/11/2015.
//  Copyright © 2015 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^_Nullable CNMNetworkingOnCompletion)(NSData *__nullable data, NSURLResponse *__nullable response, NSError *__nullable error);

@interface CNMURLSessionDataTask : NSObject

@property (nonatomic, copy) CNMNetworkingOnCompletion onCompletion;

@property (nonatomic, strong) NSURLSessionDataTask *__nonnull task;

- (void)resume;

@end
