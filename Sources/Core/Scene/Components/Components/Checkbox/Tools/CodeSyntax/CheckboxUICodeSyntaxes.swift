//
//  CheckboxUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CheckboxUICodeSyntaxes {

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
        let checkbox = SparkUICheckbox(theme: theme)
        checkbox.intent = .main
        checkbox.text = "Label"
        checkbox.isSelected = false
        checkbox.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        let checkbox = SparkUICheckbox(theme: theme)
        checkbox.intent = .main
        checkbox.text = "Label"
        checkbox.selectionState = .unselected
        checkbox.isEnabled = true
        checkbox.accessibilityLabel = "Checkbox label"
        checkbox.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
