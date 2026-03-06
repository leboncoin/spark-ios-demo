//
//  TextEditorUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextEditorUICodeSyntaxes {

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
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .neutral
        )
        textEditor.placeholder = "Placeholder"
        """
    }

    private static var full: String {
        """
        let textEditor = TextEditorUIView(
            theme: theme,
            intent: .neutral
        )
        textEditor.placeholder = "Placeholder"
        textEditor.isEditable = true
        textEditor.isScrollEnabled = true
        textEditor.isEnabled = true
        textEditor.accessibilityLabel = "Text editor label"
        textEditor.accessibilityValue = "Text editor value"
        textEditor.accessibilityHint = "Text editor hint"
        """
    }
}
