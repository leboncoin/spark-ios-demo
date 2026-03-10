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
            .init(title: "Default", code: Self.simple),
            .init(title: "Full", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        let snackbar = SnackbarUIView(
            theme: theme,
            intent: .neutral
        )
        snackbar.label.text = "This is a snackbar message"
        snackbar.setImage(.init(icon: .infoOutline))
        """
    }

    private static var full: String {
        """
        let snackbar = SnackbarUIView(
            theme: theme,
            intent: .success
        )
        snackbar.variant = .tinted
        snackbar.type = .input
        snackbar.label.text = "Operation completed successfully"
        snackbar.label.numberOfLines = 3
        snackbar.setImage(.init(icon: .checkFill))

        let button = snackbar.addButton()
        button.setTitle("Dismiss", for: .normal)
        button.addAction(UIAction(handler: { _ in
            // Handle button action
        }), for: .touchUpInside)
        """
    }
}
