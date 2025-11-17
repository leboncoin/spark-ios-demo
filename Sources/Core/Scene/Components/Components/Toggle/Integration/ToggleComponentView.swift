//
//  ToggleComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias ToggleComponentView = ComponentViewable<ToggleConfiguration, ToggleImplementationView, ToggleConfigurationView>

extension ToggleComponentView {

    init() {
        self.init(style: .alone, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct ToggleImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<ToggleConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        self.component()
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoDisabled(self.configurationWrapped)
            .demoFrame(self.configurationWrapped)
    }

    @ViewBuilder
    private func component() -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkToggle(
                theme: self.configurationWrapped.theme.value,
                isOn: self.$isOn,
                label: {
                    VStack(alignment: .leading) {
                        Text(self.configurationWrapped.text)
                            .foregroundStyle(.orange)
                        Text(self.configurationWrapped.swiftUISecondText)
                            .font(.footnote)
                            .foregroundStyle(.blue)
                    }
                }
            )
        } else if let text = configurationWrapped.text.nilIfEmpty {
            SparkToggle(
                text,
                theme: self.configurationWrapped.theme.value,
                isOn: self.$isOn
            )
        } else {
            SparkToggle(
                theme: self.configurationWrapped.theme.value,
                isOn: self.$isOn
            )
        }
    }
}

// MARK: - Preview

struct ToggleComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleComponentView()
    }
}
