//
//  BadgeUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BadgeUICodeSyntaxes {

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
        let badge = SparkUIBadge(theme: theme)
        badge.intent = .main
        badge.size = .medium
        """
    }

    private static var full: String {
        """
        let badge = SparkUIBadge(theme: theme)
        badge.intent = .main
        badge.size = .medium
        badge.value = 10
        badge.unit = "items"
        badge.isBorder = false
        badge.accessibilityLabel = "Badge label"
        """
    }
}
