//
//  FormFieldCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct FormFieldCodeSyntaxes {

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
        @State private var text: String = ""

        FormFieldView(
            theme: theme,
            feedbackState: .default,
            title: "Email",
            helper: "Please provide a valid email",
            isRequired: true,
            component: {
                TextField("Email", text: $text)
            }
        )
        """
    }

    private static var full: String {
        """
        @State private var text: String = ""

        FormFieldView(
            theme: theme,
            feedbackState: .error,
            title: "Email (exemple@mail.fr)",
            helper: "Please provide a valid email (exemple@mail.fr).",
            helperImage: Image(systemName: "exclamationmark.circle"),
            isRequired: true,
            component: {
                TextField("Email (exemple@mail.fr)", text: $text)
            }
        )
        .clearButton(
            title: "Clear",
            icon: Image(systemName: "xmark.circle")
        ) {
            text = ""
        }
        .counter(on: text, limit: 100)
        .titleAccessibilityLabel("Email field")
        .clearButtonAccessibilityLabel("Clear email")
        .helperAccessibilityLabel("Email validation error")
        .secondaryHelperAccessibilityLabel("Character count")
        .secondaryHelperAccessibilityValue("\\(text.count) of 100")
        """
    }
}
