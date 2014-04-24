//
//  TagTests.h
//  GrowthPushSample
//
//  Created by Kataoka Naoyuki on 2014/04/22.
//  Copyright (c) 2014年 SIROK, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <GrowthPush/GrowthPush.h>

#define APPLICATION_ID     (1074)
#define APPLICATION_SECRET ("sH2RhzDPNZKmXAKwqtG6pHNvDalIGk54")
#define SENDER_ID          ("870898687785")

@interface GrowthPushTestCase : XCTestCase

+ (void)initialize;
+ (void)waitOperation;
+ (void)waitOperation:(NSInteger)second;
+ (void)waitClient;
+ (void)waitClient:(NSInteger)second;
+ (void)sleep:(NSTimeInterval)second;

@end

@interface GPClient

@property (nonatomic, assign) GPEnvironment environment;

@end

@interface GPPreference : NSObject

+ (GPPreference *)sharedInstance;

@end

@interface GrowthPush ()

+ (GrowthPush *)sharedInstance;
- (GPClient *)client;
@property (nonatomic, retain) GPClient *client;
@property (nonatomic, retain) NSMutableDictionary *tags;

@end