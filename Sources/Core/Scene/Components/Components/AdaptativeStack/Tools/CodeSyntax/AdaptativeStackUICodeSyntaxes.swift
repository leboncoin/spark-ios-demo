//
//  AdaptativeStackUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct AdaptativeStackUICodeSyntaxes {

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
        let label1 = UILabel()
        label1.text = "First"

        let label2 = UILabel()
        label2.text = "Second"

        let label3 = UILabel()
        label3.text = "Third"

        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [label1, label2, label3]
        )
        stackView.regularAxis = .horizontal
        stackView.spacing = 8
        """
    }

    private static var full: String {
        """
        let label1 = UILabel()
        label1.text = "Home"

        let label2 = UILabel()
        label2.text = "Messages"

        let label3 = UILabel()
        label3.text = "Profile"

        let stackView = SparkAdaptiveUIStackView(
            arrangedSubviews: [label1, label2, label3]
        )
        stackView.regularAxis = .horizontal
        stackView.regularAlignment = .center
        stackView.spacing = 16
        stackView.accessibilityAxis = .vertical
        stackView.accessibilityAlignment = .leading
        stackView.accessibilitySpacing = 8
        """
    }
}
