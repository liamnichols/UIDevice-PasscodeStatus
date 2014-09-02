//
//  UIDevice+PasscodeStatus.h
//  PasscodeStatus
//
//  Created by Liam Nichols on 02/09/2014.
//  Copyright (c) 2014 Liam Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIDevicePasscodeStatus){
    /* The passcode status was unknown */
    UIDevicePasscodeStatusUnknown   = 0,
    /* The passcode is enabled */
    UIDevicePasscodeStatusEnabled   = 1,
    /* The passcode is disabled */
    UIDevicePasscodeStatusDisabled  = 2
};

@interface UIDevice (PasscodeStatus)

/**
 *  Determines if the device supports the `passcodeStatus` check. Passcode check is only supported on iOS 8.
 */
@property (readonly) BOOL passcodeStatusSupported;

/**
 *  Checks and returns the devices current passcode status.
 *  If `passcodeStatusSupported` returns NO then `UIDevicePasscodeStatusUnknown` will be returned.
 */
@property (readonly) UIDevicePasscodeStatus passcodeStatus;

@end
