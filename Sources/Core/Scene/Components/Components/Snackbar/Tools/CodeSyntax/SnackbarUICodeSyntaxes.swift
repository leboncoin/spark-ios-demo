//
//  SnackbarUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SnackbarUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Without Button", code: Self.withoutButton),
            .init(title: "With Button", code: Self.withButton),
            .init(title: "Show And Dismiss", code: Self.showAndDismiss),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var withoutButton: String {
        """
        let snackbar = SnackbarUIView(theme: theme, intent: .neutral)
        snackbar.label.text = "This is a snackbar message"
        snackbar.setImage(UIImage(icon: .infoOutline))
        """
    }

    private static var withButton: String {
        """
        let snackbar = SnackbarUIView(theme: theme, intent: .success)
        snackbar.label.text = "Operation completed successfully"
        snackbar.setImage(UIImage(icon: .checkFill))

        let button = snackbar.addButton()
        button.setTitle("Dismiss", for: .normal)
        button.addAction(UIAction { _ in
            // Handle button action
        }, for: .touchUpInside)
        """
    }

    private static var showAndDismiss: String {
        """
        let snackbar = SnackbarUIView(theme: theme, intent: .alert)
        snackbar.label.text = "Action required"
        snackbar.setImage(UIImage(icon: .alertDiamond))

        snackbar.showAndDismiss(
            in: view,
            from: .bottom,
            animated: true,
            insets: .zero,
            useSafeAreaLayoutGuide: false,
            autoDismissDelay: .fast
        ) { finished in
            // Completion handler
        }
        """
    }

    private static var fullConfiguration: String {
        """
        let snackbar = SnackbarUIView(theme: theme, intent: .success)
        snackbar.variant = .tinted
        snackbar.type = .horizontal
        snackbar.label.text = "Your changes have been saved"
        snackbar.label.numberOfLines = 2
        snackbar.setImage(UIImage(icon: .checkFill))

        let button = snackbar.addButton()
        button.setTitle("Undo", for: .normal)
        button.addAction(UIAction { _ in
            // Handle button action
        }, for: .touchUpInside)

        snackbar.show(
            in: view,
            from: .bottom,
            animated: true,
            insets: .zero,
            useSafeAreaLayoutGuide: true
        )
        """
    }
}
