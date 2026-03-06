//
//  CornerRadiusCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CornerRadiusCodeSyntaxes {

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
            .fill(Color.blue)
            .sparkCornerRadius(.medium)
            .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        Rectangle()
            .fill(Color.blue)
            .sparkCornerRadius(
                topLeading: 24,
                topTrailing: 16,
                bottomTrailing: 8,
                bottomLeading: 4,
                isHighlighted: false,
                isScaled: true
            )
            .sparkTheme(theme)
        """
    }
}
