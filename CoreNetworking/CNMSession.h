//
//  CNMSession.h
//  Hot
//
//  Created by GabrielMassana on 25/11/2015.
//  Copyright © 2015 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNMURLSessionDataTask;
@class CNMRequest;

@protocol CNMSessionDelegate <NSObject>

@end

@interface CNMSession : NSObject

@property (nonatomic, weak) id<CNMSessionDelegate> delegate;

+ (instancetype __nonnull)defaultSession;

- (instancetype __nonnull)initWithConfiguration:(NSURLSessionConfiguration * __nullable)configuration NS_DESIGNATED_INITIALIZER;


- (CNMURLSessionDataTask * __nonnull)makeDataTaskFromRequest:(CNMRequest * __nonnull)request;

@end
