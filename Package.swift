// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Loggage",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "Loggage",
            targets: ["Loggage"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "Loggage",
                dependencies: [],
                path: "Loggage/Loggage"),
        .testTarget(name: "LoggageTests",
                    dependencies: ["Loggage"],
                    path: "Loggage/LoggageTests"),
    ]
)
