//
//  TagComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 14/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias TagComponentView = ComponentViewable<TagConfiguration, TagImplementationView, TagConfigurationView>

// MARK: - Subview

struct TagImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<TagConfiguration>

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTagIntent(self.configurationWrapped.intent)
            .sparkTagSize(self.configurationWrapped.size)
            .sparkTagVariant(self.configurationWrapped.variant)
            .sparkTagIsHighlighted(self.configurationWrapped.isHighlighted)
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoBackground(self.configurationWrapped)
    }

    @ViewBuilder
    func component() -> some View {
        if let icon = self.configurationWrapped.icon,
           let text = self.configurationWrapped.text.nilIfEmpty,
           self.configurationWrapped.swiftUIIsCustomContent {
            SparkTag(
                theme: self.configurationWrapped.theme.value,
                icon: .init(icon: icon),
                label: {
                    Group {
                        Text(text) +
                        Text(self.configurationWrapped.swiftUISecondText)
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            )

        } else if let text = self.configurationWrapped.text.nilIfEmpty,
                  self.configurationWrapped.swiftUIIsCustomContent {
            SparkTag(
                theme: self.configurationWrapped.theme.value,
                label: {
                    Group {
                        Text(text + " ") +
                        Text(self.configurationWrapped.swiftUISecondText)
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            )

        } else if let icon = self.configurationWrapped.icon,
                  let text = self.configurationWrapped.text.nilIfEmpty {
            SparkTag(
                text,
                icon: .init(icon: icon),
                theme: self.configurationWrapped.theme.value
            )

        } else if let icon = self.configurationWrapped.icon {
            SparkTag(
                theme: self.configurationWrapped.theme.value,
                icon: .init(icon: icon)
            )

        } else {
            SparkTag(
                self.configurationWrapped.text.nilIfEmpty ?? "My Tag",
                theme: self.configurationWrapped.theme.value
            )
        }
    }
}

// MARK: - Preview

struct TagComponentView_Previews: PreviewProvider {
    static var previews: some View {
        TagComponentView()
    }
}
