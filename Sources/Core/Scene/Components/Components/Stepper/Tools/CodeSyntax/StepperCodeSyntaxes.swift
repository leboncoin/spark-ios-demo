//
//  StepperCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct StepperCodeSyntaxes {

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
        SparkStepper(
            value: $intValue,
            in: 0...10,
            step: 1
        )
        .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        SparkStepper(
            value: $floatValue,
            in: 0...100,
            step: 5,
            format: .currency(code: "EUR").locale(.init(identifier: "fr_FR"))
        )
        .disabled(false)
        .contextAccessibilityLabel("Price")
        .incrementAccessibilityLabel("Increase price")
        .decrementAccessibilityLabel("Decrease price")
        .sparkTheme(theme)
        """
    }
}
