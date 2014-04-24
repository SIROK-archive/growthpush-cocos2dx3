//
//  EventTests.m
//  GrowthPushSample
//
//  Created by Kataoka Naoyuki on 2014/04/22.
//  Copyright (c) 2014年 SIROK, Inc. All rights reserved.
//

#include "CCPlatformConfig.h"
#if CC_TARGET_PLATFORM == CC_PLATFORM_IOS

# include "GrowthPush.h"

#import "EventTests.h"

@implementation EventTests

+ (void)setUp
{
    [super setUp];
    
    [self initialize];
    
    growthpush::GrowthPush::initialize(APPLICATION_ID, APPLICATION_SECRET, growthpush::GPEnvironment::GPEnvironmentDevelopment, true);
    growthpush::GrowthPush::registerDeviceToken(SENDER_ID);
    [self waitClient:30];
    
}

- (void)setUp {
    [super setUp];
    [[self class] waitOperation:30];
}

+ (void)tearDown
{
    [super tearDown];
}

- (void)testTrackEvent
{
    growthpush::GrowthPush::trackEvent("Launch");
}

- (void)testTrackEventWithInvalidName
{
    growthpush::GrowthPush::trackEvent("");
}

- (void)testTrackEventWithValue
{
    growthpush::GrowthPush::trackEvent("Payment", "500");
}

@end

#endif
