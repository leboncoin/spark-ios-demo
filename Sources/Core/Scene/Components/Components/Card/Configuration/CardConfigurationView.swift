//
//  CardConfigurationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct CardConfigurationView: ConfigurationViewable, ConfigurationUIViewable {

    // MARK: - Type Alias

    typealias Configuration = CardConfiguration
    typealias ComponentUIView = SparkUICard

    // MARK: - Properties

    var configuration: Binding<Configuration>
    var componentImplementationViewRepresentable: ComponentImplementationRepresentable?

    // MARK: - Initialization

    init(configuration: Binding<Configuration>) {
        self.configuration = configuration
    }

    init(
        configuration: Binding<Configuration>,
        componentImplementationViewRepresentable: ComponentImplementationRepresentable
    ) {
        self.configuration = configuration
        self.componentImplementationViewRepresentable = componentImplementationViewRepresentable
    }

    // MARK: - View

    var body: some View {
        ComponentConfigurationView(
            configuration: self.configuration,
            framework: self.framework,
            componentView: {
                if let componentImplementationViewRepresentable {
                    componentImplementationViewRepresentable
                } else {
                    CardImplementationView(configuration: self.configuration)
                }
            },
            mainItemsView: {
                self.itemsView()
            }
        )
    }

    @ViewBuilder
    private func itemsView() -> some View {
        EnumConfigurationItemView(
            name: "intent",
            values: CardIntent.allCases,
            selectedValue: self.configuration.intent
        )

        EnumConfigurationItemView(
            name: "variant",
            values: CardVariant.allCases,
            selectedValue: self.configuration.variant
        )

        ToggleConfigurationItemView(
            name: "is backdrop",
            isOn: self.configuration.isBackdrop
        )

        ToggleConfigurationItemView(
            name: "is highlighted",
            isOn: self.configuration.isHighlighted
        )

        ToggleConfigurationItemView(
            name: "is padding",
            isOn: self.configuration.isPadding
        )

        if self.framework.isSwiftUI {
            ToggleConfigurationItemView(
                name: "with action",
                isOn: self.configuration.swiftUIWithAction
            )
        }
    }
}
