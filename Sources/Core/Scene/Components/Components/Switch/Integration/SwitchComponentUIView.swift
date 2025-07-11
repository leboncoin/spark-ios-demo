//
//  SwitchComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

// TODO: Test action & target on valueChanged

typealias SwitchComponentUIViewController = ComponentDisplayViewControllerRepresentable<SwitchConfiguration, SparkUISwitch, SwitchConfigurationView, SwitchComponentUIViewMaker>

extension SwitchComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class SwitchComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SwitchConfiguration
    typealias ComponentView = SparkUISwitch
    typealias ConfigurationView = SwitchConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SwitchComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(
            theme: configuration.theme.value,
            onIcon: .init(icon: Iconography.check),
            offIcon: .init(icon: Iconography.cross),
        )

        self.updateCommonProperties(
            componentView,
            for: configuration
        )

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value

        self.updateCommonProperties(
            componentView,
            for: configuration
        )
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.demoIsOn(configuration)
        componentView.demoDisabled(configuration)
        componentView.demoText(configuration)
        componentView.demoAccessibilityLabel(configuration)
    }
}

// MARK: - Extension

private extension SparkUISwitch {

    // MARK: - Methods

    func demoText(_ configuration: SwitchComponentUIViewMaker.Configuration) {
        let isText = !configuration.text.isEmpty
        let isAttributedText = configuration.uiKitIsAttributedText

        switch (isText, isAttributedText) {
        case (true, false): // Text
            self.text = configuration.text

        case (true, true): // Attributed Text
            self.attributedText = configuration.text.demoNSAttributedString

        default: // No Text
            self.text = nil
            self.attributedText = nil
        }
    }

    func demoIsOn(_ configuration: SwitchComponentUIViewMaker.Configuration) {
        if configuration.uiKitIsAnimated {
            self.setOn(configuration.uiKitIsOn, animated: true)
        } else {
            self.isOn = configuration.uiKitIsOn
        }
    }
}

private extension SwitchUIImages {

    init?(configuration: SwitchComponentUIViewMaker.Configuration) {
        return nil
    }
}
