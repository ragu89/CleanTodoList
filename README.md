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
Implementation in code rather than with Storyboards ([example](https://github.com/ragu89/CleanTodoList/blob/main/CleanTodoList/ViewsUIKit/TodosListViewController.swift)). There are several advantages with this method like:
- Each views are defined in one only file.<br/> With Storyboards or XIB, another ViewController file is required for the code behind and to manage the binding with the ViewModel
- Code merging is simplified
- Readibility is improved.<br/>Even a not iOS developer will be able to understand and update the views.
- The same paradigm can be applied to any other imperative UI framework (Android, Xamarin, ReactNative, ...).<br/>For multi skilled teams, switching context and learning curve will be simplified

Productivity and efficiency could also be better. But for a senior developer who master UIKit, that's probably discutable.<br/>
The main cons is the learning curve of the [manual implementation of the constraints](https://github.com/ragu89/CleanTodoList/blob/main/CleanTodoList/ViewsUIKit/RootViewController.swift#L47).

## SwiftUI implementation
With the standard [ObservedObject](https://developer.apple.com/documentation/swiftui/observedobject) property wrapper, the views are refreshed every time a ViewModel's property is changed/published (example in the [TodoListView](https://github.com/ragu89/CleanTodoList/blob/main/CleanTodoList/ViewsSwiftUI/TodosListView.swift#L18) with its [ViewModel](https://github.com/ragu89/CleanTodoList/blob/main/CleanTodoList/ViewModels/TodosListViewModel.swift#L14)).<br/><br/>
The declarative syntax allow us to define easily the expected views responding to different states.<br/>
For project targetting iOS13+, it should be the default choice.<br/><br/>
If you need, you can always create specific UIKit views and integrate it to the SwiftUI project (and vice versa). Check the Apple [official lesson](https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit) or the [SwiftLee example](https://www.avanderlee.com/swiftui/integrating-swiftui-with-uikit/).

## Dependency manager
As the new standard build by Apple, consider to use Swift Packages when it's possible.<br/> 
Every dependency managers have pros and cons, there are a lot of existing comparison on the web (for example [here](https://www.codementor.io/blog/swift-package-manager-5f85eqvygj) or [here](https://manasaprema04.medium.com/dependency-managers-in-swift-d6a01e7a29a8)).

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
- [ ] Create a real service connected to a back-end<br/>
- [ ] Implement more CRUD features<br/>
- [ ] Specify more topics (UI tests, Accessibility, Logger, ...)
