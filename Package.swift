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
        .package(url: "https://github.com/ggerganov/llama.cpp.git", revision: "ab6726eeffba2605130e0b8fbca545ad3ca2abb9")
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
