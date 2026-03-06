//
//  DividerCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct DividerCodeSyntaxes {

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
        SparkDivider()
            .sparkTheme(theme)
            .sparkDividerIntent(.default)
        """
    }

    private static var full: String {
        """
        SparkDivider("My Divider")
            .sparkTheme(theme)
            .sparkDividerAlignment(.center)
            .sparkDividerAxis(.horizontal)
            .sparkDividerIntent(.outline)
            .accessibilityLabel("Divider label")
        """
    }
}
