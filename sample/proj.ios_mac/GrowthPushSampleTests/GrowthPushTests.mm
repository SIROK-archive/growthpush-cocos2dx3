//

//  GrowthPushTests.m
//  GrowthPushSample
//
//  Created by Kataoka Naoyuki on 2014/04/22.
//  Copyright (c) 2014年 SIROK, Inc. All rights reserved.
//

#include "CCPlatformConfig.h"
#if CC_TARGET_PLATFORM == CC_PLATFORM_IOS

# include "GrowthPush.h"
# include "GPEnvironment.h"

# import "GrowthPushTests.h"

@implementation GrowthPushTests

+(void)setUp {
    [super setUp];
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

-(void)testRegisterWithDevelopment {

    [[self class] initialize];

    growthpush::GrowthPush::initialize(APPLICATION_ID, APPLICATION_SECRET, growthpush::GPEnvironment::GPEnvironmentDevelopment, true);
    growthpush::GrowthPush::registerDeviceToken(SENDER_ID);
    [[self class] waitClient];
    
    XCTAssertEqual(GPEnvironmentDevelopment, [[[GrowthPush sharedInstance] client] environment]);


}

-(void)testRegisterWithProduction {

    [[self class] initialize];

    growthpush::GrowthPush::initialize(APPLICATION_ID, APPLICATION_SECRET, growthpush::GPEnvironment::GPEnvironmentProduction, true);
    growthpush::GrowthPush::registerDeviceToken(SENDER_ID);
    [[self class] waitClient];
    
    XCTAssertEqual(GPEnvironmentProduction, [[[GrowthPush sharedInstance] client] environment]);

}

@end

#endif
