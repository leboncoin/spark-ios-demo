//
//  CheckboxGroupComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: Fix (or maybe a demo bug)
// - when layout changed, sometime the view is clear completly ! (seems to work correctly when the default layous is horizontal)

// MARK: - View

typealias CheckboxGroupComponentView = ComponentViewable<CheckboxGroupConfiguration, CheckboxGroupImplementationView, CheckboxGroupConfigurationView>

extension CheckboxGroupComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct CheckboxGroupImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CheckboxGroupConfiguration>
    var showInfo: Bool = true
    @State private var selectedIDs = [Int]()
    private var selectedIDsForFormField: Binding<[Int]>? // Only used by the FormField demo

    // MARK: - Initialization

    init(configuration: Binding<CheckboxGroupConfiguration>) {
        self.configuration = configuration
        self.selectedIDsForFormField = nil
    }

    // Only used by the FormField demo
    init(
        configuration: Binding<CheckboxGroupConfiguration>,
        selectedIDs: Binding<[Int]>,
        showInfo: Bool
    ) {
        self.configuration = configuration
        self.selectedIDsForFormField = selectedIDs
        self.showInfo = showInfo
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: .medium) {

            self.component()
                .sparkCheckboxGroupAxis(self.configurationWrapped.axis)
                .sparkCheckboxIntent(self.configurationWrapped.intent)
                .demoDisabled(self.configurationWrapped)
                .demoFrame(self.configurationWrapped)
                .demoAccessibilityLabel(self.configurationWrapped)

            if self.showInfo {
                Text(self.selectedItemsText())
                    .demoComponentInfoBackground()
            }
        }
    }

    @ViewBuilder
    func component() -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkCheckboxGroup(
                theme: self.configurationWrapped.theme.value,
                selectedIDs: self.selectedIDsForFormField ?? self.$selectedIDs,
                items: self.configurationWrapped.items.map { item in
                    CheckboxGroupItem(
                        id: item.id,
                        isEnabled: item.isEnabled,
                        label: {
                            VStack(alignment: .leading) {
                                Text(item.getText())
                                    .foregroundStyle(.orange)
                                Text(item.swiftUISecondText)
                                    .font(.footnote)
                                    .foregroundStyle(.blue)
                            }
                        }
                    )
                },
                selectedIcon: .init(icon: self.configurationWrapped.selectedIcon)
            )

        } else {
            SparkCheckboxGroup(
                theme: self.configurationWrapped.theme.value,
                selectedIDs: self.selectedIDsForFormField ?? self.$selectedIDs,
                items: self.configurationWrapped.items.map { item in
                    CheckboxGroupItem(
                        id: item.id,
                        title: item.getText(),
                        isEnabled: item.isEnabled
                    )
                },
                selectedIcon: .init(icon: self.configurationWrapped.selectedIcon)
            )
        }
    }

    // MARK: - Getter

    func selectedItemsText() -> String {
        return self.configurationWrapped.getInfoValue(from: self.selectedIDs)
    }
}

// MARK: - Preview

struct CheckboxGroupComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxGroupComponentView()
    }
}
