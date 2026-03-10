//
//  TagCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TagCodeSyntaxes {

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
        SparkTag("My Tag")
            .sparkTheme(theme)
            .sparkTagIntent(.main)
            .sparkTagVariant(.filled)
        """
    }

    private static var full: String {
        """
        SparkTag(
            "My Tag",
            icon: .init(icon: .spark)
        )
        .sparkTheme(theme)
        .sparkTagIntent(.main)
        .sparkTagSize(.medium)
        .sparkTagVariant(.filled)
        .sparkTagIsHighlighted(false)
        .accessibilityLabel("Tag label")
        """
    }
}
