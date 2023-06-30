# Swift on Server with Tuist

Swift on Server applications suffer from a similar challenge as standard Swift Package or Xcode projects. When developers clean their environment (with ⌘ + K), which is often a natural next step after seeing an error in Xcode, they have to build their targets and their direct and indirect Swift Package dependencies. If the dependency graph is large, as is the case with dependencies like [Vapor](https://vapor.codes) or [Hummingbird](https://github.com/hummingbird-project/hummingbird) that import [Swift NIO packages](https://github.com/apple/swift-nio), it might take minutes to compile.

Fortunately, Tuist provides a solution to this problem: **binary caching**. For those who are not familiar with Tuist, it is a tool that provides an interface to declare projects, similar to the one Swift Package Manager provides for declaring Swift Packages. However, Tuist goes further by using this information to provide optimizations that are crucial at scale, one of which is caching. Developers can use the command "tuist cache warm" to compile and store their dependency graph in a local or remote cache. They can then generate Xcode projects where some targets have been replaced with their binary counterparts. Additionally, developers have the option to indicate through arguments which targets they would like to obtain the sources for. For example, running "tuist generate MyApp Vapor" indicates that sources for the MyApp and Vapor targets are desired.

Note that Tuist's features build on Xcode and its primitives, such as Xcode projects. Therefore, the caching functionality is not available in Linux and Windows environments. However, considering that most developers develop their apps on macOS environments, the tool can be highly useful for the majority of the Swift developer community

This repository contains an example project with Hummingbird and Vapor apps, allowing people to easily explore and experiment with Tuist and its caching functionality.

## How to use Tuist with this repository

1. Install [Tuist](https://github.com/tuist/tuist) in your environment.
1. Git clone the repository: `git clone https://github.com/tuist/swift-on-server-examples.git`.
2. Fetch the dependencies with `tuist fetch`.
3. Run `tuist cache warm` to warm the cache.
4. Run `tuist generate`
