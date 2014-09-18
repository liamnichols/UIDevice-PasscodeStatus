//
//  ViewController.m
//  PasscodeStatus
//
//  Created by Liam Nichols on 02/09/2014.
//  Copyright (c) 2014 Liam Nichols. All rights reserved.
//

#import "ViewController.h"
#import "UIDevice+PasscodeStatus.h"

@interface ViewController ()

@end

@implementation ViewController {
    id notificationToken;
}
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self checkPasscodeState];
    notificationToken = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self checkPasscodeState];
    }];
}

- (void)dealloc
{
    if (notificationToken) {
        [[NSNotificationCenter defaultCenter] removeObserver:notificationToken];
        notificationToken = nil;
    }
}

- (void)checkPasscodeState
{
    LNPasscodeStatus status = [UIDevice currentDevice].passcodeStatus;
    switch (status) {
        case LNPasscodeStatusEnabled:
            self.view.backgroundColor = [UIColor greenColor];
            self.statusLabel.text = @"Passcode Enabled";
            break;
            
        case LNPasscodeStatusDisabled:
            self.view.backgroundColor = [UIColor redColor];
            self.statusLabel.text = @"Passcode Disabled";
            break;
            
        case LNPasscodeStatusUnknown:
        default:
            self.view.backgroundColor = [UIColor lightGrayColor];
            self.statusLabel.text = @"Unable to determine passcode state";
            break;
    }
}

@end
