//
//  TextEditorCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextEditorCodeSyntaxes {

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
        SparkTextEditor(
            "Placeholder",
            text: $text,
            theme: theme
        )
        .sparkTextEditorIntent(.neutral)
        """
    }

    private static var full: String {
        """
        SparkTextEditor(
            "Placeholder",
            text: $text,
            theme: theme
        )
        .sparkTextEditorIntent(.neutral)
        .sparkTextEditorReadOnly(false)
        .disabled(false)
        .sparkTextEditorAccessibilityLabel("Text editor label")
        .sparkTextEditorAccessibilityValue("Text editor value")
        .sparkTextEditorAccessibilityHint("Text editor hint")
        """
    }
}
