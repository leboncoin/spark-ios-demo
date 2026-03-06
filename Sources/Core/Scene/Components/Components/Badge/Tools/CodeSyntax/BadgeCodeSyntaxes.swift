//
//  BadgeCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BadgeCodeSyntaxes {

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
        SparkBadge()
            .sparkBadgeIntent(.main)
            .sparkBadgeSize(.medium)
            .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        SparkBadge(value: 10, unit: "items")
            .sparkBadgeIntent(.main)
            .sparkBadgeSize(.medium)
            .sparkBadgeIsBorder(false)
            .accessibilityLabel("Badge label")
            .sparkTheme(theme)
        """
    }
}
