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
            targets: ["UltraliteSDKTarget"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/a2/MessagePack.swift.git",from: Version(stringLiteral: "4.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "UltraliteSDKBinary",
            url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v0.1/UltraliteSDK.zip",
            checksum: "040c13d331395bbfed73ce487fbbd7c882807246a59b003d9bbb396a4c2d225b"
        ),
        .target(name: "UltraliteSDKTarget",
                dependencies: [.product(name: "MessagePack", package: "MessagePack.swift"),
                               .targetItem(name: "UltraliteSDKBinary", condition: nil)],
               sources: ["Sources"])
    ]
)
