//
//  TextFieldUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextFieldUICodeSyntaxes {

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
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Placeholder"
        """
    }

    private static var full: String {
        """
        let textField = TextFieldUIView(
            theme: theme,
            intent: .neutral
        )
        textField.placeholder = "Placeholder"
        textField.isSecureTextEntry = false
        textField.isReadOnly = false
        textField.clearButtonMode = .whileEditing
        textField.isEnabled = true

        let leftImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        textField.leftView = leftImageView
        textField.leftViewMode = .always

        let rightImageView = UIImageView(image: UIImage(systemName: "xmark.circle.fill"))
        textField.rightView = rightImageView
        textField.rightViewMode = .whileEditing

        textField.accessibilityLabel = "Text field label"
        """
    }
}
