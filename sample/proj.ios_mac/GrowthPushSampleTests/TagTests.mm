//
//  TagTests.m
//  GrowthPushSample
//
//  Created by Kataoka Naoyuki on 2014/04/22.
//  Copyright (c) 2014年 SIROK, Inc. All rights reserved.
//

#include "CCPlatformConfig.h"
#if CC_TARGET_PLATFORM == CC_PLATFORM_IOS

# include "GrowthPush.h"

#import "TagTests.h"

@implementation TagTests

+ (void)setUp
{
    [super setUp];
    
    [self initialize];
    
    growthpush::GrowthPush::initialize(APPLICATION_ID, APPLICATION_SECRET, growthpush::GPEnvironment::GPEnvironmentDevelopment, true);
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

- (void)testSetDeviceTags
{
    growthpush::GrowthPush::setDeviceTags();
}

- (void)testSetTag
{
    growthpush::GrowthPush::setTag("Payed User");
}

- (void)testSetTagWithInvalidName
{
    growthpush::GrowthPush::setTag("");
}

- (void)testSetTagWithValue
{
    growthpush::GrowthPush::setTag("Gender", "male");
}

@end

#endif
