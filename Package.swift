// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StarRateView",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        .library(
            name: "StarRateView",
            targets: ["StarRateView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "StarRateView",
            dependencies: []),
        .testTarget(
            name: "StarRateViewTests",
            dependencies: ["StarRateView"]),
    ]
)
