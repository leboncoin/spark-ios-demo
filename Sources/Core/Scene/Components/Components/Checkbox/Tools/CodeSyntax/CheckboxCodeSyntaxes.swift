//
//  CheckboxCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CheckboxCodeSyntaxes {

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
        SparkCheckbox(
            "Label",
            theme: theme,
            selectionState: $selectionState
        )
        .sparkCheckboxIntent(.main)
        """
    }

    private static var full: String {
        """
        SparkCheckbox(
            "Label",
            theme: theme,
            selectionState: $selectionState
        )
        .sparkCheckboxIntent(.main)
        .disabled(false)
        .accessibilityLabel("Checkbox label")
        """
    }
}
