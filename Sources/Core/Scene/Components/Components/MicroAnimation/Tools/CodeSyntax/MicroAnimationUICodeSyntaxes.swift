//
//  MicroAnimationUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct MicroAnimationUICodeSyntaxes {

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
        let iconView = SparkUIIcon(
            icon: .bellOutline,
            intent: .basic,
            size: .medium
        )

        UIView.animate(
            type: .bell,
            on: [iconView]
        )
        """
    }

    private static var full: String {
        """
        // Create animated components
        let iconView = SparkUIIcon(
            icon: .bellOutline,
            intent: .basic,
            size: .medium
        )

        let iconButton = IconButtonUIView(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            shape: .square,
            alignment: .leadingImage,
            icon: .bellOutline,
            isEnabled: true
        )

        let button = ButtonUIView(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            shape: .rounded,
            alignment: .leadingImage
        )
        button.setTitle("My Button", for: .normal)

        // Apply bell animation with repeat and completion
        UIView.animate(
            type: .bell,
            on: [
                iconView,
                iconButton,
                button.imageView
            ],
            repeat: .limited(3),
            completion: { finished in
                print("Animation completed: \\(finished)")
            }
        )
        """
    }
}
