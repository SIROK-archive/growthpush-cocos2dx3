//
//  TagTests.h
//  GrowthPushSample
//
//  Created by Kataoka Naoyuki on 2014/04/22.
//  Copyright (c) 2014年 SIROK, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>

#define APPLICATION_ID (1074)
#define APPLICATION_SECRET ("sH2RhzDPNZKmXAKwqtG6pHNvDalIGk54")

@interface GrowthPushTestCase : XCTestCase

+ (void)initialize;
+ (void)waitOperation:(NSInteger)second;
+ (void)waitClient:(NSInteger)second;
+ (void)sleep:(NSTimeInterval)second;

@end