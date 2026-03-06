//
//  ToggleCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ToggleCodeSyntaxes {

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
        SparkToggle(
            theme: theme,
            isOn: $isOn
        )
        """
    }

    private static var full: String {
        """
        SparkToggle(
            "Label",
            theme: theme,
            isOn: $isOn
        )
        .disabled(false)
        .accessibilityLabel("Toggle label")
        """
    }
}
