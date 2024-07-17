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
                url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v1.5.1/UltraliteSDK.zip",
                checksum: "32d874c9a478b004b7d2b0b9b4c71de0f4f3b58a4649f991bf1dadecf3350d97"
            ),
    ]
)
