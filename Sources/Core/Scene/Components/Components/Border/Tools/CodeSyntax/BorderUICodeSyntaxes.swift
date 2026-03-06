//
//  BorderUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BorderUICodeSyntaxes {

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
        view.backgroundColor = .systemBackground
        view.sparkBorderRadius(
            width: 2,
            radius: 8,
            colorToken: theme.colors.main.main
        )
        """
    }

    private static var full: String {
        """
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.sparkBorderRadius(
            width: 4,
            radius: 12,
            dash: 8,
            colorToken: theme.colors.feedback.error
        )
        """
    }
}
