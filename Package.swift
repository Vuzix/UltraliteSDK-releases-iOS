// swift-tools-version:5.7
import PackageDescription


let package = Package(
    name: "UltraliteSDK",
    platforms: [
        .iOS(.v14),
        .watchOS(.v9),
        .macOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UltraliteSDK",
            targets: ["UltraliteSDKBinary"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "UltraliteSDKBinary",
            url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v0.1/UltraliteSDK.zip",
            checksum: "040c13d331395bbfed73ce487fbbd7c882807246a59b003d9bbb396a4c2d225b"
        ),
    ]
)
