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
                checksum: "3a76ae27cf248cf859dcef186912ba6293b0e66fa75bb131ef1460adc63f7e02"
            ),
    ]
)
