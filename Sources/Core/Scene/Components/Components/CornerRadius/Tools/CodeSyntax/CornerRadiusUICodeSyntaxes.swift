//
//  CornerRadiusUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CornerRadiusUICodeSyntaxes {

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
        view.backgroundColor = .blue
        view.sparkCornerRadius(
            theme.border.radius.medium
        )
        """
    }

    private static var full: String {
        """
        let view = UIView()
        view.backgroundColor = .blue
        view.sparkCornerRadius(
            theme.border.radius.large,
            isHighlighted: false
        )
        """
    }
}
