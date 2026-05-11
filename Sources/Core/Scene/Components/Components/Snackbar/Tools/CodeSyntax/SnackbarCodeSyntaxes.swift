//
//  SnackbarCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SnackbarCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Without Button", code: Self.withoutButton),
            .init(title: "With Button Configuration", code: Self.withButtonConfiguration),
            .init(title: "With Button Builder", code: Self.withButtonBuilder),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var withoutButton: String {
        """
        SnackbarView(
            theme: theme,
            intent: .neutral,
            image: Image(icon: .infoOutline)
        ) {
            Text("This is a snackbar message")
        }
        """
    }

    private static var withButtonConfiguration: String {
        """
        SnackbarView(
            theme: theme,
            intent: .success,
            image: Image(icon: .checkFill)
        ) {
            Text("Operation completed successfully")
        } button: { buttonConfig in
            SparkButton("Dismiss") {
                // Your action
            }
            .sparkTheme(theme)
            .sparkButtonIntent(buttonConfig.intent)
            .sparkButtonVariant(buttonConfig.variant)
            .sparkButtonSize(buttonConfig.size)
            .sparkButtonShape(buttonConfig.shape)
        }
        """
    }

    private static var withButtonBuilder: String {
        """
        SnackbarView(
            theme: theme,
            intent: .alert,
            image: Image(icon: .alertDiamond)
        ) {
            Text("Action required")
        } button: { buttonView in
            buttonView
                .title("Undo", for: .normal)
        } action: {
            // Handle button action
        }
        """
    }

    private static var fullConfiguration: String {
        """
        SnackbarView(
            theme: theme,
            intent: .success,
            image: Image(icon: .checkFill)
        ) {
            Text("Your changes have been saved successfully")
        } button: { buttonView in
            buttonView
                .title("Dismiss", for: .normal)
        } action: {
            // Handle button action
        }
        .theme(theme)
        .intent(.success)
        .variant(.tinted)
        .type(.horizontal)
        """
    }
}
