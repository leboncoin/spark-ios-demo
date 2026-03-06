//
//  ButtonCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ButtonCodeSyntaxes {

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
        ButtonView(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            alignment: .leadingImage,
            action: { }
        )
        .title("Button", for: .normal)
        """
    }

    private static var full: String {
        """
        ButtonView(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            alignment: .leadingImage,
            action: { }
        )
        .disabled(false)
        .selected(false)
        .image(.init(icon: .spark), for: .normal)
        .title("Button", for: .normal)
        .attributedTitle(attributedString, for: .highlighted)
        .title("Selected", for: .selected)
        .title("Disabled", for: .disabled)
        .frame(maxWidth: .infinity)
        .accessibilityLabel("Button label")
        """
    }
}
