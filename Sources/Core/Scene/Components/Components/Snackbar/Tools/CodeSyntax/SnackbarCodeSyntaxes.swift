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
            .init(title: "Default", code: Self.simple),
            .init(title: "Full", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
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

    private static var full: String {
        """
        SnackbarView(
            theme: theme,
            intent: .success,
            image: Image(icon: .checkFill)
        ) {
            Text("Operation completed successfully")
        } button: { buttonView in
            buttonView
                .title("Dismiss", for: .normal)
        } action: {
            // Handle button action
        }
        .variant(.tinted)
        .type(.input)
        .lineLimit(3)
        .frame(maxWidth: 600)
        .padding()
        """
    }
}
