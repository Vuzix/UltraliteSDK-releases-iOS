// swift-tools-version:5.7
import PackageDescription


let package = Package(
    name: "UltraliteSDK",
    platforms: [
        .iOS(.v14),
        .watchOS(.v9),
    ],
    products: [
        .library(name: "UltraliteFonts", targets: ["UltraliteFonts"]),
        .library(
            name: "UltraliteSDK",
            targets: ["UltraliteSDKBinary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/a2/MessagePack.swift.git",from: Version(stringLiteral: "4.0.0")),
    ],
    targets: [
        .target(name: "UltraliteFonts",
                dependencies: [],
                resources: [
                    .copy("Resources"),
                ]),
        
        .binaryTarget(
                name: "UltraliteSDKBinary",
                url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v0.1/UltraliteSDK.zip",
                checksum: "77908f1ec7ee9b3333a7a6ad0125d003c146e0ce4a086f24a7b92fd2b52a4f81"
            ),
    ]
)
