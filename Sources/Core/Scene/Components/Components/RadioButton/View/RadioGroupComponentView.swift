//
//  RadioGroupComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

// TODO: Crash on the configuration view when we decrease the number of items. If we comment the component on the configuration, no crash appen anymore. (Not from component but maybe on demo)

import SwiftUI

// MARK: - View

typealias RadioGroupComponentView = ComponentViewable<RadioGroupConfiguration, RadioGroupImplementationView, RadioGroupConfigurationView>

extension RadioGroupComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct RadioGroupImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<RadioGroupConfiguration>
    var showInfo: Bool = true

    @State private var selectedID: Int? = Bool.random() ? 1 : nil
    private var selectedIDForFormField: Binding<Int?>? // Only used by the FormField demo

    // MARK: - Initialization

    init(configuration: Binding<RadioGroupConfiguration>) {
        self.configuration = configuration
        self.selectedIDForFormField = nil
    }

    // Used by the FormField demo
    init(
        configuration: Binding<RadioGroupConfiguration>,
        selectedID: Binding<Int?>,
        showInfo: Bool = false
    ) {
        self.configuration = configuration
        self.showInfo = showInfo
        self.selectedIDForFormField = selectedID
    }

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: .medium) {

            self.component()
                .sparkRadioGroupAxis(self.configurationWrapped.axis)
                .sparkRadioButtonIntent(self.configurationWrapped.intent)
                .demoDisabled(self.configurationWrapped)
                .demoFrame(self.configurationWrapped)
                .demoAccessibilityLabel(self.configurationWrapped)

            if self.showInfo {
                Text(self.configurationWrapped.getInfoValue(from: self.selectedID))
                    .demoComponentInfoBackground()
            }
        }
    }

    @ViewBuilder
    func component() -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkRadioGroup(
                theme: self.configurationWrapped.theme.value,
                selectedID: self.selectedIDForFormField ?? self.$selectedID,
                items: self.configurationWrapped.items.map { item in
                    RadioGroupItem(
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
                }
            )

        } else {
            SparkRadioGroup(
                theme: self.configurationWrapped.theme.value,
                selectedID: self.selectedIDForFormField ?? self.$selectedID,
                items: self.configurationWrapped.items.map { item in
                    RadioGroupItem(
                        id: item.id,
                        title: item.getText(),
                        isEnabled: item.isEnabled
                    )
                }
            )
        }
    }
}

// MARK: - Preview

struct RadioGroupComponentView_Previews: PreviewProvider {
    static var previews: some View {
        RadioGroupComponentView()
    }
}
