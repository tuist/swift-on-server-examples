import ProjectDescription

let baseSettings: SettingsDictionary = [:]

func debugSettings() -> SettingsDictionary {
    var settings = baseSettings
    settings["ENABLE_TESTABILITY"] = "YES"
    return settings
}

func releaseSettings() -> SettingsDictionary {
    baseSettings
}

let project = Project(name: "TuistOnServer", 
                      options: .options(
                        textSettings: .textSettings(usesTabs: false, indentWidth: 4, tabWidth: 4)
                      ),
                      settings: .settings(
                        configurations: [
                            .debug(name: "Debug", settings: debugSettings(), xcconfig: nil),
                            .release(name: "Release", settings: releaseSettings(), xcconfig: nil),
                        ]
                      ),
                      targets: [
                        Target(name: "vapor-app",
                               platform: .macOS,
                               product: .commandLineTool,
                               bundleId: "io.tuist.VaporApp",
                               deploymentTarget: .macOS(targetVersion: "12.0"),
                               sources: ["Sources/VaporApp/**/*"],
                               dependencies: [
                                .external(name: "Vapor")
                               ],
                               settings: .settings(
                                configurations: [
                                    .debug(name: "Debug", settings: [:], xcconfig: nil),
                                    .release(name: "Release", settings: [:], xcconfig: nil),
                                ]
                               )),
                        Target(name: "hummingbird-app",
                               platform: .macOS,
                               product: .commandLineTool,
                               bundleId: "io.tuist.HummingbirdApp",
                               deploymentTarget: .macOS(targetVersion: "12.0"),
                               sources: ["Sources/HummingbirdApp/**/*"],
                               dependencies: [
                                .external(name: "ArgumentParser"),
                                .external(name: "Hummingbird"),
                                .external(name: "HummingbirdFoundation")
                               ],
                               settings: .settings(
                                configurations: [
                                    .debug(name: "Debug", settings: [:], xcconfig: nil),
                                    .release(name: "Release", settings: [:], xcconfig: nil),
                                ]
                               ))
                      ])
