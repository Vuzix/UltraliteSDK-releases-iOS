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
        .library(name: "UltraliteFonts", targets: ["UltraliteFonts"]),
        .library(
            name: "UltraliteSDK",
            targets: ["UltraliteSDK"]),
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
                name: "UltraliteSDK",
                url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v1.0/UltraliteSDK.zip",
                checksum: "188f14351491118f69c57a854435061701d4d7e603d4bfeede0db41edd061f2e"
            ),
    ]
)
