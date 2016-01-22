//
//  CNMRequest.h
//  CoreNetworking
//
//  Created by GabrielMassana on 25/11/2015.
//  Copyright © 2015 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const CNMHTTPRequestMethodGet;
extern NSString * const CNMHTTPRequestMethodPost;
extern NSString * const CNMHTTPRequestMethodPut;
extern NSString * const CNMHTTPRequestMethodDelete;
extern NSString * const CNMHTTPRequestMethodHead;

@interface CNMRequest : NSMutableURLRequest

@end
