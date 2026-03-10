//
//  IconCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct IconCodeSyntaxes {

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
        SparkIcon(.init(icon: .arrows))
            .sparkIconIntent(.main)
            .sparkIconSize(.medium)
            .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        SparkIcon(.init(icon: .arrows))
            .sparkIconIntent(.main)
            .sparkIconSize(.medium)
            .accessibilityLabel("Icon label")
            .accessibilityHidden(false)
            .sparkTheme(theme)
        """
    }
}
