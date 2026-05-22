//
//  SnackbarComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias SnackbarComponentUIViewController = ComponentDisplayViewControllerRepresentable<SnackbarConfiguration, SparkUISnackbar, SnackbarConfigurationView, SnackbarComponentUIViewMaker, SnackbarExtraTools>

extension SnackbarComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class SnackbarComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SnackbarConfiguration
    typealias ComponentView = SparkUISnackbar
    typealias ConfigurationView = SnackbarConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SnackbarComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = SnackbarExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value
        )

        self.updateCommonProperties(componentView, for: configuration)
        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.intent = configuration.intent
        componentView.alignment = configuration.alignment
        componentView.icon = .init(icon: configuration.icon)

        componentView.demoTitle(configuration)
        componentView.demoMessage(configuration)
        componentView.demoButton(configuration)
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

private extension SparkUISnackbar {

    // MARK: - Setter

    func demoTitle(_ configuration: SnackbarComponentUIViewMaker.Configuration) {
        let text = configuration.title.nilIfEmpty

        if let text, configuration.uiKitIsAttributedTitle {
            self.attributedTitle = text.demoNSAttributedString
        } else {
            self.title = text
        }
    }

    func demoMessage(_ configuration: SnackbarComponentUIViewMaker.Configuration) {
        let text = configuration.message.nilIfEmpty

        if let text, configuration.uiKitIsAttributedMessage {
            self.attributedMessage = text.demoNSAttributedString
        } else {
            self.message = text
        }
    }

    func demoButton(_ configuration: SnackbarComponentUIViewMaker.Configuration) {
        guard configuration.hasButton else {
            self.button = nil
            return
        }

        let text = configuration.buttonTitle.nilIfEmpty ?? "Action"
        let button = SparkUIButton(theme: configuration.theme.value)
        button.setTitle(text, for: .normal)
        self.button = button
    }
}
