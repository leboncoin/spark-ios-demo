//
//  SegmentedGaugeComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: Tox fix :
// - Constraints crash on TableView demo

// MARK: - View Controller

typealias SegmentedGaugeComponentUIViewController = ComponentDisplayViewControllerRepresentable<SegmentedGaugeConfiguration, UIView, SegmentedGaugeConfigurationView, SegmentedGaugeComponentUIViewMaker>

extension SegmentedGaugeComponentUIViewController {

    init() {
        self.init(style: .alone)
    }
}

// MARK: - View Maker

final class SegmentedGaugeComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SegmentedGaugeConfiguration
    typealias ComponentView = UIView
    typealias ConfigurationView = SegmentedGaugeConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SegmentedGaugeComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {

//        // View for attach
//        let rectangleView = UIView()
//        rectangleView.backgroundColor = .blue
//        rectangleView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            rectangleView.widthAnchor.constraint(equalToConstant: 40),
//            rectangleView.heightAnchor.constraint(equalToConstant: 40)
//        ])
//        self.rectangleView = rectangleView
//
//        // SegmentedGauge
//        let badgeView = SparkUISegmentedGauge(
//            theme: configuration.theme.value
//        )
//        self.badgeView = badgeView

        // Background
        let backgroundView = UIView()
//        backgroundView.translatesAutoresizingMaskIntoConstraints = false
//        backgroundView.addSubview(rectangleView)
//        backgroundView.addSubview(badgeView)
//
//        self.updateCommonProperties(backgroundView, for: configuration)

        return backgroundView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
//        self.badgeView?.theme = configuration.theme.value
//
//        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
//        guard let badgeView, let rectangleView else {
//            return
//        }
//
//        badgeView.intent = configuration.intent
//        badgeView.size = configuration.size
//        badgeView.value = configuration.isValue ? configuration.value.nilIfZero : nil
//        badgeView.unit = configuration.unit.nilIfEmpty
//        badgeView.isBorder = configuration.isBorder
//        badgeView.demoAccessibilityLabel(configuration)
//
//        rectangleView.isHidden = !configuration.isAttached
//
//        // Clear constraints
//        self.leadingConstraint?.isActive = false
//        self.topConstraint?.isActive = false
//        self.trailingConstraint?.isActive = false
//        self.bottomConstraint?.isActive = false
//
//        componentView.removeConstraints([
//            self.leadingConstraint,
//            self.topConstraint,
//            self.trailingConstraint,
//            self.bottomConstraint
//        ].compactMap { $0 })
//
//        if configuration.isAttached {
//            badgeView.attach(to: rectangleView, position: configuration.position)
//        } else {
//            badgeView.detach()
//        }
//
//        let referenceView = configuration.isAttached ? rectangleView : badgeView
//
//        self.leadingConstraint = referenceView.leadingAnchor.constraint(equalTo: componentView.leadingAnchor)
//        self.leadingConstraint?.isActive = true
//
//        self.topConstraint = referenceView.topAnchor.constraint(equalTo: componentView.topAnchor)
//        self.topConstraint?.isActive = true
//
//        self.trailingConstraint = referenceView.trailingAnchor.constraint(equalTo: componentView.trailingAnchor)
//        self.trailingConstraint?.isActive = true
//
//        self.bottomConstraint = referenceView.bottomAnchor.constraint(equalTo: componentView.bottomAnchor)
//        self.bottomConstraint?.isActive = true
    }
}
