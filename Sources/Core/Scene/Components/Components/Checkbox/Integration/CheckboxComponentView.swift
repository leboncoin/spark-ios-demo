//
//  CheckboxComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CheckboxComponentView = ComponentViewable<CheckboxConfiguration, CheckboxImplementationView, CheckboxConfigurationView>

// MARK: - Subview

struct CheckboxImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxConfiguration>
    @State private var selectionState: SparkComponentSelectionControls.CheckboxSelectionState = .unselected

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            self.component()
            .demoDisabled(self.configurationWrapped)
            .demoFrame(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)

            Text(self.configurationWrapped.getInfoValue(from: self.selectionState))
                .demoComponentInfoBackground()
        }
    }

    @ViewBuilder
    func component() -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkCheckbox(
                theme: self.configurationWrapped.theme.value,
                selectionState: self.$selectionState,
                selectedIcon: .selected,
                indeterminateIcon: .indeterminate,
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
            SparkCheckbox(
                text,
                theme: self.configurationWrapped.theme.value,
                selectionState: self.$selectionState,
                selectedIcon: .selected,
                indeterminateIcon: .indeterminate,
            )
        } else {
            SparkCheckbox(
                theme: self.configurationWrapped.theme.value,
                selectionState: self.$selectionState,
                selectedIcon: .selected,
                indeterminateIcon: .indeterminate,
            )
        }
    }
}

// MARK: - Extension

private extension Image {

    static var selected: Image {
        .init(icon: Iconography.check)
    }

    static var indeterminate: Image {
        .init(icon: Iconography.minus)
    }
}

// MARK: - Preview

struct CheckboxComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxComponentView()
    }
}
