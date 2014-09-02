UIDevice-PasscodeStatus
=======================

A UIDevice category to determine if the passcode is currently set on the device or not.

Requirements
--
 - iOS 8
 - A Physical Device
 
How it Works
--
This category works by using the new accessControl features added to the Security.Framework in iOS 8.
It attempts to add an item to the keychain using the `kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly` protection level.  

The documentation states the following:

> Item data can only be accessed while the device is unlocked. This class is only 
         available if a passcode is set on the device. This is recommended for
         items that only need to be accessible while the application is in the
         foreground. Items with this attribute will never migrate to a new 
         device, so after a backup is restored to a new device, these items 
         will be missing. **No items can be stored in this class on devices 
         without a passcode.** Disabling the device passcode will cause all 
         items in this class to be deleted.
         
Because of this, an error is returned when you attempt to add or read an item in the keychain with this level of accessControl. If we see this error, the `passcodeStatus` returns as `UIDevicePasscodeStatusDisabled`.
If we can successfully read or write to the keychain with this level of accessControl then we return `UIDevicePasscodeStatusEnabled`.

If the device is unsupported or an unrelated error with the keychain is returned, we return `UIDevicePasscodeStatusUnknown`.

Installation
-
**Cocoapods:**  
 `pod 'UIDevice-PasscodeStatus', '~> 0.0'`

**Manually:**  
 Just copy the category from the `Source/` directory into your project and import `Security.Framework`
