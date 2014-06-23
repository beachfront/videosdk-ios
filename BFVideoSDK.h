//
//  BFVideoSDK.h
//  BFVideoSDK
//
//  Created by Todd Kuehnl on 6/13/14.
//  Copyright (c) 2014 Beachfront Media, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

//Managers
//#import <BFVideoSDK/BFAnalyticsManager.h>
//#import <BFVideoSDK/BFConfigManager.h>
//#import <BFVideoSDK/BFUserManager.h>
//#import <BFVideoSDK/BFBuilderClient.h>
#import <BFVideoSDK/BFVideoViewController.h>

#define BFBUILDER_API_BASE_URL            @"http://client.beachfrontbuilder.com"
#define BFBUILDER_API_ANALYTICS_BASE_URL  @"http://log.bfbapi.com"


extern NSString * const BFBuilderAppStartedNotification;
extern NSString * const BFBuilderAppFailedToStartNotification;
extern NSString * const BFBuilderAppShouldProceedPush;

extern NSString* BeachFrontSDKAppKey;
extern NSString* BeachFrontSDKAppBuildID;

@interface BFVideoSDK : NSObject

+ (instancetype)sharedManager;
/*!
 Initializes the SDK with the app-key and app-buildid that you have recieved from BeachFrontBuilder.
 @param appKey The application key for your BeachFrontBuilder Application.
 @param applicationId The application buildid for your BeachFrontBuilder Application.
 */
- (void)startWithAppKey:(NSString *)appKey appBuildID:(NSString*)appBuildID;
- (void)getAppChannels:(void (^)(NSArray* channels))success
               failure:(void (^)(NSError* error))failure;

- (void)getChannelVideosWith:(NSString *)channelId pageNum:(NSInteger)pageNum success: (void (^)(NSDictionary *videos))success
failure:(void (^)(NSError *error))failure;

- (void)getMediaFromVideo:(NSObject *)video success:( void(^)(NSString *mediaURL))success failure:(void (^)(NSError *error))failure;

- (void)startSession;
- (void)endSession;


@end
