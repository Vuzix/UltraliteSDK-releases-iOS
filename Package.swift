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
                url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v1.1/UltraliteSDK.zip",
                checksum: "37e221c0f11541fce4c58444f48e8c92d568851a09125badebb0b3c8046bb573"
            ),
    ]
)
