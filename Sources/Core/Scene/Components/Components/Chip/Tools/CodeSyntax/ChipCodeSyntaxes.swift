//
//  ChipCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ChipCodeSyntaxes {

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
        SparkChip(
            "Label",
            icon: .init(icon: .spark),
            action: { }
        )
        .sparkChipIntent(.main)
        .sparkChipVariant(.filled)
        .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        SparkChip(
            "Label",
            icon: .init(icon: .spark),
            action: { }
        )
        .sparkChipIntent(.main)
        .sparkChipVariant(.filled)
        .sparkChipAlignment(.leadingIcon)
        .sparkIsSelected(false)
        .disabled(false)
        .accessibilityLabel("Chip label")
        .sparkTheme(theme)
        """
    }
}
