//
//  AdaptativeStackCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct AdaptativeStackCodeSyntaxes {

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
        SparkAdaptiveStack(
            axis: .horizontal,
            spacing: 8
        ) {
            Text("First")
            Text("Second")
            Text("Third")
        }
        .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        SparkAdaptiveStack(
            axis: .horizontal,
            alignment: .center,
            spacing: 16,
            accessibilityAlignment: .leading,
            accessibilitySpacing: 8
        ) {
            Text("Home")
            Text("Messages")
            Text("Profile")
        }
        .sparkTheme(theme)
        """
    }
}
