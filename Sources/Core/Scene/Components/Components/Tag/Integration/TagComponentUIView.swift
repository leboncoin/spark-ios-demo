//
//  TagComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: Tox fix :
// - Fix accessibilty : add accessibility for the component and remove the listener on UILabel,
// TODO: constraints break when clear entire text

// MARK: - View Controller

typealias TagComponentUIViewController = ComponentDisplayViewControllerRepresentable<TagConfiguration, SparkUITag, TagConfigurationView, TagComponentUIViewMaker>

// MARK: - View Maker

final class TagComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = TagConfiguration
    typealias ComponentView = SparkUITag
    typealias ConfigurationView = TagConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, TagComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = SparkUITag(theme: configuration.theme.value)
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
        componentView.size = configuration.size
        componentView.variant = configuration.variant
        componentView.isHighlighted = configuration.isHighlighted
        componentView.demoIcon(configuration)
        componentView.demoText(configuration)
        componentView.demoAccessibility(configuration)
    }
}

// MARK: - Extension

private extension SparkUITag {

    // MARK: - Setter

    // TODO: Use this logic (optional parameters) (set only if needed to check the default visual when the parameter is not setted) for all components
    /// Used to set only if needed
    func demoIcon(_ configuration: TagComponentUIViewMaker.Configuration) {
        let newIcon = configuration.icon
        if let newIcon {
            self.icon = .init(icon: newIcon)
        } else if self.icon != nil {
            self.icon = nil
        }
    }

    func demoText(_ configuration: TagComponentUIViewMaker.Configuration) {
        let text = configuration.text.nilIfEmpty
        if configuration.uiKitIsAttributedText {
            self.attributedText = text?.demoNSAttributedString
        } else if let text {
            self.text = text
        } else if self.attributedText != nil {
            self.attributedText = nil
        } else if self.text != nil {
            self.text = nil
        }
    }

    func demoAccessibility(_ configuration: TagComponentUIViewMaker.Configuration) {
        self.demoAccessibilityLabel(configuration)
        if configuration.text.nilIfEmpty == nil {
            self.largeContentTitle = configuration.accessibilityLabel.value.nilIfEmpty
        }
    }
}
