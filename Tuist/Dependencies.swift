import ProjectDescription

let dependencies = Dependencies(swiftPackageManager: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.77.0"),
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "1.6.0"),
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.2"),
])
