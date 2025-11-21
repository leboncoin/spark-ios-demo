//
//  DividerComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 28/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias DividerComponentView = ComponentViewable<DividerConfiguration, DividerImplementationView, DividerConfigurationView>

extension DividerComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct DividerImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<DividerConfiguration>

    // MARK: - View

    var body: some View {
        VStack {
            self.component()
                .sparkTheme(self.configurationWrapped.theme.value)
                .sparkDividerAlignment(self.configurationWrapped.alignment)
                .sparkDividerAxis(self.configurationWrapped.axis)
                .sparkDividerIntent(self.configurationWrapped.intent)
                .demoAccessibilityLabel(self.configurationWrapped)
                .frame(minHeight: self.configurationWrapped.axis.height)

        }
    }

    @ViewBuilder
    private func component() -> some View {
        if let text = self.configurationWrapped.text.nilIfEmpty,
           self.configurationWrapped.swiftUIIsCustomContent {
            SparkDivider {
                Group {
                    Text(text + " ") +
                    Text(self.configurationWrapped.swiftUISecondText)
                        .foregroundColor(.blue)
                        .italic()
                }
            }

        } else if let text = self.configurationWrapped.text.nilIfEmpty {
            SparkDivider(text)

        } else {
            SparkDivider()
        }
    }
}

// MARK: - Preview

struct DividerComponentView_Previews: PreviewProvider {
    static var previews: some View {
        DividerComponentView()
    }
}
