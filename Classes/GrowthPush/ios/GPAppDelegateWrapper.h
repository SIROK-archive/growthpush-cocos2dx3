//
//  GPAppDelegateWrapper.h
//
//  Created by Kataoka Naoyuki on 2013/07/14.
//

#import <Foundation/Foundation.h>
#import "GPAppDelegateWrapperDelegate.h"

@interface GPAppDelegateWrapper : UIResponder <UIApplicationDelegate> {

    id <GPAppDelegateWrapperDelegate> delegate;

}

@property (nonatomic, assign) id <GPAppDelegateWrapperDelegate> delegate;

- (void)setOriginalAppDelegate:(UIResponder <UIApplicationDelegate> *)newOriginalAppDelegate;

@end
