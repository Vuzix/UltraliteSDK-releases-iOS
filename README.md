![Vuzix Logo](https://apps.vuzix.com/images/vuzix-logo-old.png)

# Ultralite SDK for iOS
Use this library to connect your iOS, WatchOS, or MacOS app to the Vuzix Z100™ smart glasses. Easily connect, send notifications, send text, or send images to the glasses display.

## Requirements
- iOS version 14+ OR WatchOS version 9+ OR MacOS version 11+ (Supports Swift 5.7+)
- Vuzix Z100™ smart glasses


## Installation 
You can install this library three different ways, swift package manager, cocoapods or by embedding the framework.
### Swift Package Manager

You can easily integrate the UltraliteSDK in your app with Swift Package Manager. 

In Xcode add a new package dependency to [https://github.com/Vuzix/UltraliteSDK-releases-iOS](https://github.com/Vuzix/UltraliteSDK-releases-iOS)

You can do this one of two ways: 

- in Xcode, go to project settings and tap the `Package Dependencies` tab, tap the plus sign to add a new dependency

OR 
- if using a Package.swift project, declare a new dependency in your Package.swift
```
	dependencies: [
        .package(url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS", branch: "main"),
    ],
```

### CocoaPods
In your podfile ...
```
pod 'UltraliteSDK'
```

### EMBEDED Framework
download the [release zip](https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases) file in this repo, unzip it and include the xcFramework in your workspace. Don't forget to link `UltraliteSDK` library to your target.  

## Usage
To easily start there are two classes of convenience within the SDK.  
(*You do not have to use these classes.  They are simply for quickness and convenience.  If you need your own custom experience, everything done in these two classes is public in the SDK.*) 
### Ultralite Picker Controller
The Ultralite Picker Control shows an alert style dialog over the current context.  The dialog allows the user to select a pair of glasses to communicate with.  Behind the scenes, it will do all the Bluetooth scanning, finding paired and nearby devices, and communicating, so the user can focus on selecting a pair of Vuzix Z100™. 
### Ultralite Base View Contoller
Allows any UIViewController to inherit this View Controller functionality.  You can easily launch the pairing picker, start and stop control of the Vuzix Z100™, along with listening to all the events such as onTap, onPowerButton, onDisplayTimeout, etc. 

```
class MyViewController: UltraliteBaseViewController {
	private var isConnectedListener: BondListener<Bool>?

	override func viewDidLoad() {
		super.viewDidLoad()

		if let device = UltraliteManager.shared.currentDevice, device.isConnected.value == true {
			// we have a device and are connected
			draw()
		}
		else if UltraliteManager.shared.currentDevice != nil {
			// we have a device but it isn't connected
			isConnectedListener = BondListener(listener: { [weak self] value in
				if value {
					draw()
				}
			})
			UltraliteManager.shared.currentDevice?.isConnected.bind(listener: isConnectedListener!)
		}
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
        
		if UltraliteManager.shared.currentDevice == nil {
			// we have no device, show show the user the picker
			showPairingPicker()
		}
	}

	func draw() {
		guard let device = UltraliteManager.shared.currentDevice else {
			return
		}
		
		// start control
		layout = .canvas
		startControl()

		if let image = UIImage(systemName: "face.smiling")?.cgImage {
			// draw something to the screen
			device.canvas.drawBackground(image: image, x: 100, y: 100)
			// don't forget to commit, this is a common mistake.  
			device.canvas.commit()
		}

	}

}

```


## Documentation

API level documentation is available [HERE](https://vuzix.github.io/UltraliteSDK-releases-iOS/documentation/ultralitesdk/)


### Sample App
Sample code showing several example use cases is available [here](https://github.com/Vuzix/ultralite-sdk-ios-sample).

## Legal
Use of the SDK is available to developers agreeing to the
[VUZIX® SOFTWARE DEVELOPMENT KIT LICENSE AND CONFIDENTIALITY AGREEMENT](https://www.vuzix.com/pages/vuzix%C2%AE-software-development-kit-license-and-confidentiality-agreement)


