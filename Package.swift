// swift-tools-version:5.7
import PackageDescription


let package = Package(
    name: "UltraliteSDK",
    platforms: [
        .iOS(.v14),
        .watchOS(.v9),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "UltraliteSDK",
            targets: ["UltraliteSDK"]),
    ],
    targets: [
        .binaryTarget(
                name: "UltraliteSDK",
                url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v1.2/UltraliteSDK.zip",
                checksum: "9d8a037c0c01269bf3b8e2f88be8f7c556a01caec705ac1f3e0234e0ac6839e2"
            ),
    ]
)
