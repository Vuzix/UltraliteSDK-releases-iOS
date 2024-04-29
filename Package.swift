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
                url: "https://github.com/Vuzix/UltraliteSDK-releases-iOS/releases/download/v1.4/UltraliteSDK.zip",
                checksum: "b09e7421735038c68bc405a99c8dd0243fb29253fbdeeab668a4681d7a335850"
            ),
    ]
)
