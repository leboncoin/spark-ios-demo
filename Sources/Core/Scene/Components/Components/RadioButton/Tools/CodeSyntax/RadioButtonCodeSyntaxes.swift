//
//  RadioButtonCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RadioButtonCodeSyntaxes {

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
        SparkRadioButton(
            "Label",
            theme: theme,
            isSelected: $isSelected
        )
        .sparkRadioButtonIntent(.main)
        """
    }

    private static var full: String {
        """
        SparkRadioButton(
            "Label",
            theme: theme,
            isSelected: $isSelected
        )
        .sparkRadioButtonIntent(.main)
        .disabled(false)
        .accessibilityLabel("Radio button label")
        """
    }
}
