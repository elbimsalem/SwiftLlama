// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftLlama",
    platforms: [
        .macOS(.v12),
        .iOS(.v16),
        .watchOS(.v9),
        .tvOS(.v16),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "SwiftLlama", targets: ["SwiftLlama"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ggerganov/llama.cpp.git", revision: "ab6726eeff50b89354fa0fd938825468947c38f5")
    ],
    targets: [
        .target(
            name: "SwiftLlama",
            dependencies: [
                .product(name: "llama", package: "llama.cpp")
            ],
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        ),
        .testTarget(name: "SwiftLlamaTests", dependencies: ["SwiftLlama"])
    ]
)
