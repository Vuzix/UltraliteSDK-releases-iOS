# UltraliteSDK

Use this library to connect an iPhone, Apple Watch or Mac to your Vuzix Ultralite smart glasses.
Easily connect and pair, send notifictions, send text or send bitmaps to the screen.


## Installation (SPM OR Embeded)

### Swift Package Manager

You can easily integrate the UltraliteSDK in your app with Swift Package Manager. 

In Xcode add a new package dependency to [https://github.com/Vuzix/UltraliteSDK-releases-iOS](https://github.com/Vuzix/UltraliteSDK-releases-iOS)

You can do this one of two ways: 

- in Xcode, go to project settings and tap the Package Dependencies tab, tap the plus sign to add a new dependency
- OR if using a Package.swift project, declare a new dependency in your Package.swift
```
	dependencies: [
        .package(url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS", branch: "main"),
    ],
```
	


### EMBEDED Framework
Or download the zip file in this repo, unzip it and include the xcFramework in your workspace. Don't forget to link library to your target.  

## Documentation

Documentation is located [HERE](https://vuzix.github.io/UltraliteSDK-releases-iOS/documentation/ultralitesdk/)


### Sample App
Please refer to the sample app for a quick demostration of how to use this framework. Located in /sample

## Supports
- iOS version 14+
- WatchOS version 9+
- Supports Swift 5.7 and up. 


