//
//  BorderRadiusUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BorderRadiusUICodeSyntaxes {

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
        let view = UIView()
        view.backgroundColor = theme.colors.support.supportVariant.uiColor
        view.sparkBorderRadius(
            width: theme.border.width.medium,
            radius: theme.border.radius.medium,
            colorToken: theme.colors.main.main
        )
        """
    }

    private static var full: String {
        """
        let view = UIView()
        view.backgroundColor = theme.colors.support.supportVariant.uiColor

        // With dash pattern
        view.sparkBorderRadius(
            width: theme.border.width.medium,
            radius: theme.border.radius.medium,
            dash: 4,
            colorToken: theme.colors.main.main
        )

        // With highlight state
        view.sparkBorderRadius(
            width: theme.border.width.medium,
            radius: theme.border.radius.medium,
            isHighlighted: true,
            colorToken: theme.colors.main.main
        )
        """
    }
}
