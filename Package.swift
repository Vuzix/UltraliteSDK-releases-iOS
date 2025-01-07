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
                url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v1.8.0/UltraliteSDK.zip",
                checksum: "5ef1bc24479666f55872151254606b2de9a4760420e28a7fa419bda6f0ba2cd2"
            ),
    ]
)
