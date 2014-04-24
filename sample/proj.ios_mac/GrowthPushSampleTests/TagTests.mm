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

# import "TagTests.h"

@implementation TagTests

+(void)setUp {
    [super setUp];

    [self initialize];

    growthpush::GrowthPush::initialize(APPLICATION_ID, APPLICATION_SECRET, growthpush::GPEnvironment::GPEnvironmentDevelopment, true);
    growthpush::GrowthPush::registerDeviceToken(SENDER_ID);
    [self waitClient];

}

+(void)tearDown {
    [super tearDown];
}

-(void)setUp {
    [super setUp];
    [[self class] waitOperation];
}

-(void)tearDown {
    [super tearDown];
}

-(void)testSetDeviceTags {
    
    growthpush::GrowthPush::setDeviceTags();
    [[self class] waitOperation];
    
    XCTAssertNotNil([[[GrowthPush sharedInstance] tags] objectForKey:@"OS"]);
    XCTAssertNotNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Version"]);
    XCTAssertNotNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Language"]);
    XCTAssertNotNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Time Zone"]);
    XCTAssertNotNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Device"]);
    XCTAssertNotNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Build"]);
    
}

-(void)testSetTag {
    
    XCTAssertNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Payed User"]);
    growthpush::GrowthPush::setTag("Payed User");
    
    [[self class] waitOperation];
    XCTAssertNotNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Payed User"]);
    
}

-(void)testSetTagWithInvalidName {
    
    NSUInteger tagsCount = [[[GrowthPush sharedInstance] tags] count];
    growthpush::GrowthPush::setTag("");
    
    [[self class] waitOperation];
    XCTAssertEqual([[[GrowthPush sharedInstance] tags] count], tagsCount);
    
}

-(void)testSetTagWithValue {
    XCTAssertNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Gender"]);
    growthpush::GrowthPush::setTag("Gender", "male");
    
    [[self class] waitOperation];
    XCTAssertNotNil([[[GrowthPush sharedInstance] tags] objectForKey:@"Gender"]);
    
}

@end

#endif
