## BeachFrontBuilder iOS SDK Usage Guide

## Overview
A more developer-friendly way of working with Beachfront Media iOS SDK,  Simply add sdk framework & dependencies to your iOS project, call the appropriate methods and you're done :)

## Features

*  Get video channels
*  Get the videos from a channel supported by pagination
*  Search videos from a channel or from all.
*  Get detail of a specific video
*  Video Player native component
*  Supports video display both portrait and landscape.
*  Monetize video with pre-roll ads using the backend monetization rules
*  Robust Analytics - # installtion & video view is supported out of the box 
*  Revenue tracking

## Requirements

* BeachFrontBuilder App Key & App Build ID - [Get it from here](http://beachfrontbuilder.com/signup)
* BeachFrontBuilder SDK EmbeddedFramework
* Xcode 4.5 or higher

## Installation
1. Access the BeachFrontBuilderSDK Console and get your App Key & App Build ID.

2. Download the BeachFrontBuilder iOS SDK Embedded Framwork and copy it into your project Folder.

3. Add the BFVideoSDK.framework to your project and make sure BFVideoSDK.framework is included in the "Link Binary with Libraries" panel in the project "Build Phases" section.

4. Also add the following frameworks and libraries one by one by clicking on the + button in the "Link Binary With Libraries" panel.
```
	- Foundation.framework
	- UIKit.framework
	- CoreGraphics.framework
	- MediaPlayer.framework
	- MobileCoreServices.framework
	- Social.framework
	- SystemConfiguration.framework
	- QuartzCore.framework
	- libxml2.dylib
```
5. Make sure that the BFVideoSDK.framework is included in the "Copy Bundle Resources" panel.

6. In your Build Settings add the flag "-ObjC" to your "Other Linker Flags" entry.

7. In your app delegate import the framework header and initialize the SDK in your application:didFinishLaunchingWithOptions: method

```
#import <BeachFrontBuilderSDK/BeachFrontBuilderSDK.h>
..
..
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{	
	..
	..
    //Initialize BeachFrontBuilderSDK
    [BeachFrontBuilderSDK startWithAppKey:<YOUR-APP-KEY-HERE> appBuildID:<YOUR-APP-BUILD-ID-HERE>];
    ..
    ..
}
```

8. Use the Channel API to retrieve the available video channels for your application:

```

NSArray *_channels;

[[BFVideoSDK sharedManager]getAppChannels:^(NSArray *channels){
        _channels = channels;
    }failure:^(NSError *error){
        NSLog(@"Error loading channels: %@",error.description);
    }];
```

9. Use the getChannelVideosWith:channelID method to retrieve the videos from a channelID:

```
NSArray *_videos;

[[BFVideoSDK sharedManager]getChannelVideosWith:channelID pageNum:0 success:^(NSDictionary *videoInfo){
        NSLog(@"getChannelVideos");
        _videos = [videoInfo valueForKey:@"videos"];
    }failure:^(NSError *error){
        NSLog(@"Error loading channel videos: %@", error.description);
    }];
   
```

9. To play a video use the included BFMVideoDetailController class:

```
CGRect _rect = CGRectMake(0, 68, self.view.bounds.size.width, self.view.bounds.size.width * 0.7);
self.videoController = [[BFVideoViewController alloc] initWithVideo:video andRect:_rect];
[self.view addSubview:self.videoController.view];
    
```

See the included example application for more details on integration.

Have a bug? Please [create an issue on GitHub](https://github.com/beachfront/beachfront-videosdk-ios/issues)!
