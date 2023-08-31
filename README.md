# UltraliteSDK

Use this library to connect an iphone or Apple Watch to your Vuzix Ultralite smart glasses.
Easily connect and pair, send notifictions, send text or send bitmaps to the screen.


## Installation (SPM OR Embeded)

### Swift Package Manager

You can easily integrate the UltraliteSDK in your app with Swift Package Manager. 

In XCode add a new package dependency to [https://github.com/Vuzix/UltraliteSDK-releases-iOS](https://github.com/Vuzix/UltraliteSDK-releases-iOS)

You can do this one of two ways: 

1. in Xcode, go to project settings and tap the Package Dependencies tab, tap the plus sign to add a new dependency
1. in Package.swift, declare a new dependency
	```
	dependencies: [
        .package(url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS", branch: "main"),
    ],
```
	


### EMBEDED Framework
Or download the zip file in this repo, unzip it and include the xcFramework in your workspace. Don't forget to link both librarys to your target.  

## Documentation

Documentation is located [HERE](https://vuzix.github.io/UltraliteSDK-releases-iOS/documentation/ultralitesdk/)


## Support
- iOS version 14+
- WatchOS version 9+
- Supports Swift 5.7 and up. 


