//
//  CheckboxComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

// TODO: To Fix
// Remove isEnabled on init
// Remove delegate

// MARK: - View Controller

typealias CheckboxComponentUIViewController = ComponentDisplayViewControllerRepresentable<CheckboxConfiguration, CheckboxUIView, CheckboxConfigurationView, CheckboxComponentUIViewMaker>

// MARK: - View Maker

final class CheckboxComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = CheckboxConfiguration
    typealias ComponentView = CheckboxUIView
    typealias ConfigurationView = CheckboxConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, CheckboxComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = if configuration.uiKitIsAttributedText {
            ComponentView(
                theme: configuration.theme.value,
                intent: .info,
                attributedText: configuration.text.demoNSAttributedString,
                checkedImage: .init(icon: configuration.checkedIcon),
//                selectionState: configuration.uiKitSelectionState,
                selectionState: .indeterminate,
                alignment: .left
            )
        } else {
            ComponentView(
                theme: configuration.theme.value,
                intent: .info,
                text: configuration.text,
                checkedImage: .init(icon: configuration.checkedIcon),
//                selectionState: configuration.uiKitSelectionState,
                selectionState: .indeterminate,
                alignment: .left
            )
        }

        componentView.publisher.sink { value in
//            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: componentView.selectionState)
            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: .indeterminate)
        }
        .store(in: &self.cancellables)

        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value
        componentView.intent = .info
        componentView.demoText(configuration)
        componentView.checkedImage = .init(icon: configuration.checkedIcon)
//        componentView.selectionState = configuration.uiKitSelectionState
        componentView.selectionState = .indeterminate
        componentView.alignment = configuration.alignment

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoDisabled(configuration)
        componentView.demoAccessibilityLabel(configuration)

        //            configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: componentView.selectionState)
        configuration.uiKitInfoLabel?.text = configuration.getInfoValue(from: .indeterminate)

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

private extension CheckboxUIView {

    func demoText(_ configuration: CheckboxConfiguration) {
        if configuration.uiKitIsAttributedText {
            self.attributedText = configuration.text.demoNSAttributedString
        } else {
            self.text = configuration.text
        }
    }
}

