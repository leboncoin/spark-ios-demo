//
//  RadioButtonGroupComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// TODO: To Fix
// Remove delegate & publisher

// TODO: Rename to RadioGroup

// MARK: - Component

typealias RadioButtonIntUIGroupView = RadioButtonUIGroupView<Int>

// MARK: - View Controller

typealias RadioButtonGroupComponentUIViewController = ComponentDisplayViewControllerRepresentable<RadioButtonGroupConfiguration, RadioButtonIntUIGroupView, RadioButtonGroupConfigurationView, RadioButtonGroupComponentUIViewMaker>

extension RadioButtonGroupComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class RadioButtonGroupComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = RadioButtonGroupConfiguration
    typealias ComponentView = RadioButtonIntUIGroupView
    typealias ConfigurationView = RadioButtonGroupConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, RadioButtonGroupComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            intent: .info,
            selectedID: configuration.uiKitSelectedId >= 0 ? configuration.uiKitSelectedId : nil,
            items: configuration.items.map { .init($0) },
            labelAlignment: .leading,
            groupLayout: .vertical
        )
        self.updateCommonProperties(componentView, for: configuration)

        componentView.publisher.sink { value in
            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: value)
        }
        .store(in: &self.cancellables)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = .info
        componentView.selectedID = configuration.uiKitSelectedId >= 0 ? configuration.uiKitSelectedId : nil
        componentView.items = configuration.items.map { .init($0) }
        componentView.groupLayout = .vertical
        componentView.labelAlignment = .leading

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)

        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: componentView.selectedID)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }

    func isInfoLabel() -> Bool {
        true
    }
}

// MARK: - Extension

private extension RadioButtonUIItem {

    init(_ configuration: RadioButtonGroupConfiguration.Item) where ID == Int {

        let text = configuration.getText()

        if configuration.isAttributedText {
            self.init(id: configuration.id, label: text.demoNSAttributedString)
        } else {
            self.init(id: configuration.id, label: text)
        }
    }
}
