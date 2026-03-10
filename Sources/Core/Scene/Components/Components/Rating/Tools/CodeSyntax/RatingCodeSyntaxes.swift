//
//  RatingCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RatingCodeSyntaxes {

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
        // Display
        SparkRatingDisplay(value: 4.5)
            .sparkTheme(theme)

        // Input
        @State private var rating: Double = 3.0

        SparkRatingInput(value: $rating)
            .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        // Display with text
        SparkRatingDisplay(
            value: 4.5,
            valueText: "4.5",
            countText: "(1,234)",
            additionalText: "Reviews"
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.small)
        .sparkRatingDisplayStars(.one)

        // Display with custom labels
        SparkRatingDisplay(
            value: 4.5,
            valueLabel: {
                Text("4.5").bold()
            },
            countLabel: {
                Text("(1,234)").foregroundColor(.gray)
            },
            additionalLabel: {
                Text("Reviews").italic()
            }
        )
        .sparkTheme(theme)
        .sparkRatingDisplaySize(.medium)
        .sparkRatingDisplayStars(.five)

        // Input with disabled state
        @State private var rating: Double = 3.0

        SparkRatingInput(value: $rating)
            .sparkTheme(theme)
            .disabled(false)
        """
    }
}
