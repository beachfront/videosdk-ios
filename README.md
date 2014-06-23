## BeachFrontBuilder iOS SDK Usage Guide

## Overview
This document details the process of integrating the BeachfrontBuilder SDK with your iOS application. 

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

Have a bug? Please [create an issue on GitHub](https://github.com/beachfront/beachfront-videosdk-ios/issues)!
