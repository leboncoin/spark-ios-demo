# ``SparkDemo``

The Spark Demo contains all Spark components in UIKit and SwiftUI and the details of the Theming.

## Overview

By default, there is three entries in the TabBar : 
- **SwiftUI** : contains all SwiftUI components.
- **UIKit** :  contains all UIKit components.
- **Other** : contains the current theming solution (*by default* : SparkTheme from [SparkTheming](https://github.com/leboncoin/spark-ios-theming/) repository)

### Implementation

#### Default implementation (without any customization)

In the body of your **@main** view, you can add :
```swift

// Needed import
@_exported import SparkDemo

@main
struct MyApp: App {

    // MARK: - Initialization

    init() {
        SparkConfiguration.load()
    }

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
```

#### With customization implementation

- Create a class inherits from ``DemoTheme`` to implement your own theming solution :
```swift
enum MyThemes: DemoTheme {
    case lbc
    case other

    // MARK: - Properties

    static var mainTheme: Self {
        Self.lbc
    }

    var value: any Theme {
        switch self {
        case .lbc:
            LBCTheme()
        case .other:
            OtherTheme()
        }
    }
}

// ******************************
// Then add the themes in the App
// ******************************

@main
struct MyApp: App {

    // MARK: - Initialization

    init() {
        DemoThemes.shared = .init(value: MyThemes.self)
    }

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
```

![Default Integration rendering.](default_integration.png)

- Add an another entry in the Tabbar :
```swift

// Needed import
@_exported import SparkDemo

@main
struct MyApp: App {

    // MARK: - Initialization

    init() {
        SparkConfiguration.load()
    }

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            MainView {
                YourTabItemView()
                    .tabItem {
                        Image(systemName: "fire.extinguisher")
                        Text("Fire")
                    }
            }
        }
    }
}
```
 
![Custom Integration rendering.](custom_integration.png)
