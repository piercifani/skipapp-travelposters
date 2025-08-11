// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription

let package = Package(
    name: "travel-posters-model",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .tvOS(.v17),
        .watchOS(.v10),
        .macCatalyst(.v17)
    ],
    products: [
        .library(name: "TravelPostersModel", type: .dynamic, targets: ["TravelPostersModel"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.6.11"),
        .package(url: "https://source.skip.tools/skip-fuse.git", from: "1.0.2"),
        .package(url: "https://source.skip.tools/skip-model.git", from: "1.5.0")
    ],
    targets: [
        .target(
            name: "TravelPostersModel",
            dependencies: [
                .product(
                    name: "SkipModel",
                    package: "skip-model"
                ),
                .product(
                    name: "SkipFuse",
                    package: "skip-fuse"
                ),
            ],
            resources: [.process(
                "Resources"
            )],
            plugins: [.plugin(
                name: "skipstone",
                package: "skip"
            )]
        ),
        .testTarget(
            name: "TravelPostersModelTests",
            dependencies: [
                "TravelPostersModel"
            ],
            resources: [.process(
                "Resources"
            )],
        ),
    ]
)
