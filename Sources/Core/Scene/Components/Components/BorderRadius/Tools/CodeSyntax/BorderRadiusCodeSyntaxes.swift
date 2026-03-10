//
//  BorderRadiusCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BorderRadiusCodeSyntaxes {

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
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                radius: theme.border.radius.medium,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var full: String {
        """
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                radius: theme.border.radius.medium,
                dash: 4,
                isHighlighted: true,
                colorToken: theme.colors.main.main,
                position: .outside,
                isScaled: true
            )

        // Custom radius for each corner
        Rectangle()
            .fill(theme.colors.support.supportVariant.color)
            .sparkBorder(
                width: theme.border.width.medium,
                topLeadingRadius: 8,
                topTrailingRadius: 16,
                bottomTrailingRadius: 8,
                bottomLeadingRadius: 16,
                dash: 0,
                isHighlighted: false,
                colorToken: theme.colors.main.main,
                position: .inside,
                isScaled: true
            )
        """
    }
}
