//
//  ChipUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ChipUICodeSyntaxes {

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
        let chip = SparkUIChip(theme: theme)
        chip.intent = .main
        chip.variant = .filled
        chip.text = "Label"
        chip.icon = .init(icon: .spark)
        chip.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        """
    }

    private static var full: String {
        """
        let chip = SparkUIChip(theme: theme)
        chip.intent = .main
        chip.variant = .filled
        chip.alignment = .leadingIcon
        chip.text = "Label"
        chip.icon = .init(icon: .spark)
        chip.isSelected = false
        chip.isEnabled = true
        chip.accessibilityLabel = "Chip label"
        chip.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        """
    }
}
