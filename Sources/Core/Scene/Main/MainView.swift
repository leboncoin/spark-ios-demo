//
//  MainView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

 public struct MainView<OtherTab>: View where OtherTab: View {

     // MARK: - Properties

     @ViewBuilder private let otherTab: (() -> OtherTab)?

     // MARK: - Initialization

     public init() where OtherTab == EmptyView {
         self.otherTab = nil
     }

     /// Init the main view with a custom other tab.
     /// This tab will be between the *UIKit componants** and the **other** tab.
     ///
     /// Implementation example :
     /// ```swift
     /// @main
     /// struct MyView: View {
     ///
     ///     var body: some Scene {
     ///         MainView() {
     ///             YourTabItemView()
     ///                 .tabItem {
     ///                     Image(systemName: "the system icon")
     ///                     Text("The tab item name")
     ///                 }
     ///         }
     ///     }
     /// }
     /// ```
     ///
     public init(
         @ViewBuilder otherTab: @escaping () -> OtherTab
     ) {
         self.otherTab = otherTab
     }

    // MARK: - View

    public var body: some View {
        TabView {
            // Components
            ForEach(Framework.allCases, id: \.rawValue) { framework in
                ComponentsView(framework: framework)
                    .tabItem {
                        Image(systemName: framework.icon)
                        Text(framework.name)
                    }
            }

            // Other Tab (used by SparkKit)
            self.otherTab?()

            // Other
            OtherView()
                .tabItem {
                    Image(systemName: "ellipsis.circle")
                    Text("Other")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
