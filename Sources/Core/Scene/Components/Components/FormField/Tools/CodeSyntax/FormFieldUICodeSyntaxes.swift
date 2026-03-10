//
//  FormFieldUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FormFieldUICodeSyntaxes {

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
        let textField = UITextField()
        textField.placeholder = "Email"

        let formField = FormFieldUIView(
            theme: theme,
            component: textField,
            feedbackState: .default,
            title: "Email",
            helper: "Please provide a valid email",
            isRequired: true
        )
        """
    }

    // swiftlint:disable no_debugging_method
    private static var full: String {
        """
        let textField = UITextField()
        textField.placeholder = "Email (exemple@mail.fr)"
        textField.addAction(UIAction(handler: { action in
            guard let textField = action.sender as? UITextField else { return }
            print("Text changed: \\(textField.text ?? "")")
        }), for: .editingChanged)

        let formField = FormFieldUIView(
            theme: theme,
            component: textField,
            feedbackState: .error,
            title: "Email (exemple@mail.fr)",
            helper: "Please provide a valid email (exemple@mail.fr).",
            isRequired: true
        )

        // Set helper image
        formField.helperImage = UIImage(systemName: "exclamationmark.circle")

        // Configure clear button
        formField.clearButtonImage = UIImage(systemName: "xmark.circle")
        formField.clearButton.addAction(UIAction(handler: { _ in
            textField.text = ""
        }), for: .touchUpInside)

        // Set counter
        formField.setCounter(on: textField.text, limit: 100)

        // Set accessibility labels
        formField.titleLabel.accessibilityLabel = "Email field"
        formField.clearButton.accessibilityLabel = "Clear email"
        formField.helperLabel.accessibilityLabel = "Email validation error"
        formField.secondaryHelperLabel.accessibilityLabel = "Character count"
        formField.secondaryHelperLabel.accessibilityValue = "\\(textField.text?.count ?? 0) of 100"
        """
    }
}
