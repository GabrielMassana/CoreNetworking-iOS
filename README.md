# CoreNetworking-iOS

[![Version](https://img.shields.io/cocoapods/v/CoreNetworking.svg?style=flat-square)](http://cocoapods.org/pods/CoreNetworking)
[![License](https://img.shields.io/cocoapods/l/CoreNetworking.svg?style=flat-square)](http://cocoapods.org/pods/CoreNetworking)
[![Platform](https://img.shields.io/cocoapods/p/CoreNetworking.svg?style=flat-square)](http://cocoapods.org/pods/CoreNetworking)
[![CocoaPods](https://img.shields.io/cocoapods/metrics/doc-percent/CoreNetworking.svg?style=flat-square)](http://cocoapods.org/pods/CoreNetworking)
[![Build Status](https://img.shields.io/travis/GabrielMassana/CoreNetworking-iOS/master.svg?style=flat-square)](https://travis-ci.org/GabrielMassana/CoreNetworking-iOS)

Wrapper project to simplify NSURLSession.

# How to Install it

#### Podfile

```ruby
platform :ios, '8.0'
pod 'CoreNetworking', '~> 1.0'
```
#### Old school

Drag into your project the folder `/CoreNetworking-iOS`. That's all.

## Example

```objc

#import "CNMSession.h"
#import "CNMRequest.h"
#import "CNMURLSessionDataTask.h"

...

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
        }
        else
        {
            NSLog(@"error %@", error);
        }
    };
    
    [task resume];

```

## License

ButtonBackgroundColor-iOS is released under the MIT license. Please see the file called LICENSE.

## Versions

```bash
$ git tag -a 1.0.0 -m 'Version 1.0.0'

$ git push --tags
```

## Author

Gabriel Massana

##Found an issue?

Please open a [new Issue here](https://github.com/GabrielMassana/CoreNetworking-iOS/issues/new) if you run into a problem specific to CoreNetworking-iOS, have a feature request, or want to share a comment.

