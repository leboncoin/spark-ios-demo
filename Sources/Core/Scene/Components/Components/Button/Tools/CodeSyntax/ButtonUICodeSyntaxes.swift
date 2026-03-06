//
//  ButtonUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ButtonUICodeSyntaxes {

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
        let button = ButtonUIView(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            alignment: .leadingImage
        )
        button.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        button.setTitle("Button", for: .normal)
        """
    }

    private static var full: String {
        """
        let button = ButtonUIView(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            alignment: .leadingImage
        )
        button.addAction(UIAction(handler: { _ in }), for: .touchUpInside)
        button.isEnabled = true
        button.isSelected = false
        button.isAnimated = true
        button.setImage(.init(icon: .spark), for: .normal)
        button.setTitle("Button", for: .normal)
        button.setAttributedTitle(attributedString, for: .highlighted)
        button.setTitle("Selected", for: .selected)
        button.setTitle("Disabled", for: .disabled)
        button.accessibilityLabel = "Button label"
        """
    }
}
