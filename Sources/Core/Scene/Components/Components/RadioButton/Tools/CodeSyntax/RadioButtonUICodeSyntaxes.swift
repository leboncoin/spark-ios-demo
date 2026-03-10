//
//  RadioButtonUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RadioButtonUICodeSyntaxes {

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
        let radioButton = SparkUIRadioButton(theme: theme)
        radioButton.intent = .main
        radioButton.text = "Label"
        radioButton.isSelected = false
        radioButton.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        let radioButton = SparkUIRadioButton(theme: theme)
        radioButton.intent = .main
        radioButton.text = "Label"
        radioButton.isSelected = false
        radioButton.setIsSelected(false, animated: true)
        radioButton.isEnabled = true
        radioButton.accessibilityLabel = "Radio button label"
        radioButton.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
