//
//  IconUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct IconUICodeSyntaxes {

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
        let icon = SparkUIIcon(
            theme: theme,
            image: .init(icon: .arrows)
        )
        icon.intent = .main
        icon.size = .medium
        """
    }

    private static var full: String {
        """
        let icon = SparkUIIcon(
            theme: theme,
            image: .init(icon: .arrows)
        )
        icon.intent = .main
        icon.size = .medium
        icon.accessibilityLabel = "Icon label"
        icon.isAccessibilityElement = true
        """
    }
}
