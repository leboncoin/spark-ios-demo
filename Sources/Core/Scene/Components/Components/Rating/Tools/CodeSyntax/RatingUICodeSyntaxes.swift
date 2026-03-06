//
//  RatingUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RatingUICodeSyntaxes {

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
        let ratingDisplay = SparkUIRatingDisplay(theme: theme)
        ratingDisplay.value = 4.5

        // Input
        let ratingInput = SparkUIRatingInput(theme: theme)
        ratingInput.value = 3.0
        ratingInput.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        // Display with all text properties
        let ratingDisplay = SparkUIRatingDisplay(theme: theme)
        ratingDisplay.value = 4.5
        ratingDisplay.size = .small
        ratingDisplay.stars = .one
        ratingDisplay.text = "4.5"
        ratingDisplay.countText = "(1,234)"
        ratingDisplay.additionalText = "Reviews"

        // Display with attributed text
        let attributedRatingDisplay = SparkUIRatingDisplay(theme: theme)
        attributedRatingDisplay.value = 4.5
        attributedRatingDisplay.size = .medium
        attributedRatingDisplay.stars = .five
        attributedRatingDisplay.attributedText = NSAttributedString(
            string: "4.5",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 14)]
        )
        attributedRatingDisplay.attributedCountText = NSAttributedString(
            string: "(1,234)",
            attributes: [.foregroundColor: UIColor.gray]
        )
        attributedRatingDisplay.attributedAdditionalText = NSAttributedString(
            string: "Reviews",
            attributes: [.font: UIFont.italicSystemFont(ofSize: 12)]
        )

        // Input with action
        let ratingInput = SparkUIRatingInput(theme: theme)
        ratingInput.value = 3.0
        ratingInput.isEnabled = true
        ratingInput.addAction(UIAction(handler: { action in
            guard let ratingInput = action.sender as? SparkUIRatingInput else { return }
            print("Rating changed to: \\(ratingInput.value)")
        }), for: .valueChanged)
        """
    }
}
