import ProjectDescription

let project = Project(name: "TuistOnServer", targets: [
    Target(name: "v-cli",
           platform: .macOS,
           product: .commandLineTool,
           bundleId: "io.tuist.vapor",
           deploymentTarget: .macOS(targetVersion: "13.4.1"),
           sources: ["Sources/v-cli/**/*"],
           dependencies: [
            .target(name: "VaporApp")
           ]
          ),
    Target(name: "VaporApp",
           platform: .macOS,
           product: .staticLibrary,
           bundleId: "io.tuist.VaporApp",
           deploymentTarget: .macOS(targetVersion: "13.4.1"),
           sources: ["Sources/VaporApp/**/*"],
           dependencies: [
            .external(name: "Vapor")
           ]),
    Target(name: "hb-cli",
           platform: .macOS,
           product: .commandLineTool,
           bundleId: "io.tuist.hummingbird",
           deploymentTarget: .macOS(targetVersion: "13.4.1"),
           sources: ["Sources/hb-cli/**/*"],
           dependencies: [
            .target(name: "HummingbirdApp")
           ]
          ),
    Target(name: "HummingbirdApp",
           platform: .macOS,
           product: .staticLibrary,
           bundleId: "io.tuist.HummingbirdApp",
           deploymentTarget: .macOS(targetVersion: "13.4.1"),
           sources: ["Sources/HummingbirdApp/**/*"],
           dependencies: [
            .external(name: "ArgumentParser"),
            .external(name: "Hummingbird"),
            .external(name: "HummingbirdFoundation")
           ])
])
