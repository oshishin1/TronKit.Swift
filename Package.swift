// swift-tools-version:5.5
import PackageDescription

let package = Package(
        name: "TronKit",
        platforms: [
          .iOS(.v13),
        ],
        products: [
          .library(
                  name: "TronKit",
                  targets: ["TronKit"]
          ),
        ],
        dependencies: [
          .package(url: "https://github.com/attaswift/BigInt.git", .upToNextMajor(from: "5.0.0")),
          .package(url: "https://github.com/Kitura/BlueSocket.git", .upToNextMajor(from: "2.0.0")),
          .package(url: "https://github.com/groue/GRDB.swift.git", .upToNextMajor(from: "6.0.0")),
          .package(url: "https://github.com/tristanhimmelman/ObjectMapper.git", .upToNextMajor(from: "4.1.0")),
          .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.21.0"),
          .package(url: "https://github.com/horizontalsystems/HsCryptoKit.Swift.git", .upToNextMajor(from: "1.2.1")),
          .package(url: "https://github.com/oshishin1/HdWalletKit.Swift.git", .upToNextMajor(from: "1.2.1")),
          .package(url: "https://github.com/horizontalsystems/HsToolKit.Swift.git", .upToNextMajor(from: "2.0.0")),
          .package(url: "https://github.com/horizontalsystems/HsExtensions.Swift.git", .upToNextMajor(from: "1.0.6")),
        ],
        targets: [
          .target(
                  name: "TronKit",
                  dependencies: [
                    "BigInt",
                    .product(name: "Socket", package: "BlueSocket"),
                    .product(name: "GRDB", package: "GRDB.swift"),
                    "ObjectMapper",
                    .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                    .product(name: "HsCryptoKit", package: "HsCryptoKit.Swift"),
                    .product(name: "HdWalletKit", package: "HdWalletKit.Swift"),
                    .product(name: "HsToolKit", package: "HsToolKit.Swift"),
                    .product(name: "HsExtensions", package: "HsExtensions.Swift"),
                  ]
          )
        ]
)
