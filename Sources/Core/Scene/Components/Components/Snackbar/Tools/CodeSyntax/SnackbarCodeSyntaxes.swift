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
            .init(title: "Basic Snackbar", code: Self.basicSnackbar),
            .init(title: "With Icon", code: Self.withIcon),
            .init(title: "With Action Button", code: Self.withActionButton),
            .init(title: "Custom Content", code: Self.customContent),
            .init(title: "Different Alignment", code: Self.differentAlignment)
        ]
    }()

    // MARK: - Private Properties

    private static var basicSnackbar: String {
        """
        SparkSnackbar(
            title: "Upload complete",
            description: "Your file has been uploaded successfully"
        )
        .sparkTheme(theme)
        .sparkSnackbarIntent(.success)
        """
    }

    private static var withIcon: String {
        """
        SparkSnackbar(
            Image(systemName: "wifi.slash"),
            title: "Connection lost",
            description: "Unable to reach the server"
        )
        .sparkTheme(theme)
        .sparkSnackbarIntent(.error)
        """
    }

    private static var withActionButton: String {
        """
        SparkSnackbar(
            Image(systemName: "trash"),
            title: "Item deleted",
            description: "The item has been removed"
        ) {
            SparkButton("Undo") {
                // Undo action
            }
            .sparkButtonVariant(.ghost)
        }
        .sparkTheme(theme)
        .sparkSnackbarIntent(.alert)
        """
    }

    private static var customContent: String {
        """
        SparkSnackbar(
            Image(systemName: "bell.fill"),
            titleLabel: {
                Text("New Message")
                    .bold()
            },
            descriptionLabel: {
                VStack(alignment: .leading, spacing: 4) {
                    Text("John Doe")
                    Text("Hello, how are you?")
                        .font(.caption)
                }
            }
        )
        .sparkTheme(theme)
        .sparkSnackbarIntent(.info)
        """
    }

    private static var differentAlignment: String {
        """
        SparkSnackbar(
            title: "Settings saved",
            description: "Your preferences have been updated"
        )
        .sparkTheme(theme)
        .sparkSnackbarIntent(.success)
        .sparkSnackbarAlignment(.vertical)
        """
    }
}
