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
                url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v0.5/UltraliteSDK.zip",
                checksum: "e8ba6d7645af4d46bf0876fcd38c4a4c06efafad2779cc9733c4b6a4f0f7fce8"
            ),
    ]
)
