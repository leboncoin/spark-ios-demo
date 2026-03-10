//
//  BorderCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BorderCodeSyntaxes {

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
            .fill(.background)
            .frame(height: 48)
            .sparkBorder(
                width: 2,
                colorToken: theme.colors.main.main
            )
        """
    }

    private static var full: String {
        """
        Rectangle()
            .fill(.background)
            .frame(height: 48)
            .sparkBorder(
                width: 4,
                dash: 8,
                colorToken: theme.colors.feedback.error,
                isScaled: true
            )
        """
    }
}
