//
//  TagUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TagUICodeSyntaxes {

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
        let tag = SparkUITag(theme: theme)
        tag.intent = .main
        tag.variant = .filled
        tag.text = "My Tag"
        """
    }

    private static var full: String {
        """
        let tag = SparkUITag(theme: theme)
        tag.intent = .main
        tag.size = .medium
        tag.variant = .filled
        tag.isHighlighted = false
        tag.text = "My Tag"
        tag.icon = .init(icon: .spark)
        tag.accessibilityLabel = "Tag label"
        """
    }
}
