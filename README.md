# CleanTodoList

## Introduction
This is a proposition of a Clean Architecture for iOS projects.

Based on the MVVM pattern and powered by [Combine](https://developer.apple.com/documentation/combine).<br/>
Dependency injection made with [Resolver](https://github.com/hmlongco/Resolver).

This project contains two UI implementations : One with UIKit and one with SwiftUI. Both are using the same ViewModels.

## SceneDelegate
For both UIKit and SwiftUI, The entry point is the [SceneDelegate](https://github.com/ragu89/CleanTodoList/blob/main/CleanTodoList/SceneDelegate.swift).<br/>
In that way, you can easily choose which App you want to start (UIKit or SwiftUI). For a pure SwiftUI app, consider to use the [@main attribute](https://github.com/apple/swift-evolution/blob/master/proposals/0281-main-attribute.md) from Swift 5.3 together with the [UIApplicationDelegateAdaptor](https://developer.apple.com/documentation/swiftui/uiapplicationdelegateadaptor) from iOS 14 ([example](https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app)).

## UIKit implementation
todo

## SwiftUI implementation
todo

## Dependency injection
Resolver and its [annotation injection strategy](https://github.com/hmlongco/Resolver/blob/master/Documentation/Injection.md#annotation) is a good candidate for a lightweight DI strategy. It doesn't contain a lot of boilerplate code and it's easy to setup ([example](https://github.com/ragu89/CleanTodoList/tree/main/CleanTodoList/Resolver) as described in the [official documentation](https://github.com/hmlongco/Resolver/blob/master/Documentation/Registration.md#add-the-appdelegate-injection-file)).<br/>
Another good choice proposed on SwiftLee is to write [your own implementation without a 3rd party library](https://www.avanderlee.com/swift/dependency-injection/).<br/>
The paper described several advantages. Consider to switch to this strategy if you want to reduce your dependencies.


## TODO

- [x] Setup project with DI and unit tests<br/>
- [x] UIKit implementation - first view and navigation<br/>
- [x] SwiftUI implementation - first view and navigation<br/>
- [ ] Writting doc in README<br/>
- [ ] Create a Model<br/>
- [ ] Create a real service connected to a (fake) back-end<br/>
- [ ] Implement all the CRUD features<br/>
