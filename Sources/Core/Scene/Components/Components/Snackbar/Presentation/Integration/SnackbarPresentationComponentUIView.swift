//
//  SnackbarPresentationComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias SnackbarPresentationComponentUIViewController = ComponentDisplayViewControllerRepresentable<SnackbarPresentationConfiguration, UIButton, SnackbarPresentationConfigurationView, SnackbarPresentationComponentUIViewMaker, SnackbarExtraTools>

extension SnackbarPresentationComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class SnackbarPresentationComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SnackbarPresentationConfiguration
    typealias ComponentView = UIButton
    typealias ConfigurationView = SnackbarPresentationConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SnackbarPresentationComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = SnackbarExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    private var snackbar: SparkUISnackbar = {
        let theme = DemoThemes.shared.mainTheme.value

        let snackbar = SparkUISnackbar(theme: theme)
        snackbar.title = "Title"
        snackbar.message = "Snackbar placeholder"
        snackbar.widthAnchor.constraint(lessThanOrEqualToConstant: 600).isActive = true

        let button = SparkUIButton(theme: theme)
        button.setTitle("Action", for: .normal)
        button.addAction(.init(handler: { _ in
            snackbar.dismiss(completion: { isFinished in
                // swiftlint:disable no_debugging_method
                print("Dismiss action", isFinished)
            })
        }), for: .touchUpInside)
        snackbar.button = button

        return snackbar
    }()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let button = UIButton(configuration: .filled())
        button.setTitle("Show snackbar", for: .normal)
        button.addAction(.init(handler: { [weak self] _ in
            self?.actionHandler(for: configuration)
        }), for: .touchUpInside)
        return button
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        // Nothing to do here
    }

    // MARK: - Actions

    private func actionHandler(for configuration: Configuration) {
        guard let viewController else {
            return
        }

        if let autoDismissDelay = configuration.autoDismissDelay {
            self.snackbar.showAndDismiss(
                in: viewController.view,
                animated: configuration.uiKitIsAnimated,
                autoDismissDelay: autoDismissDelay
            ) { isFinished in
                // swiftlint:disable no_debugging_method
                print("Auto dismiss", isFinished)
            }
        } else {
            self.snackbar.show(
                in: viewController.view,
                animated: configuration.uiKitIsAnimated
            )
        }
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

