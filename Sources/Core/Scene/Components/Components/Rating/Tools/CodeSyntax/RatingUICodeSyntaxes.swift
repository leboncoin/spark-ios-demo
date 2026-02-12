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
            .init(title: "Display", code: Self.display),
            .init(title: "Display with parameters", code: Self.displayWithParameters),
            .init(title: "Input", code: Self.input)
        ]
    }()

    // MARK: - Private Properties

    private static var display: String {
        """
        let ratingDisplay = SparkUIRatingDisplay(theme: MyTheme.shared)
        ratingDisplay.value = 3.76
        ratingDisplay.text = "(3,76)"
        self.addSubview(ratingDisplay)
        """
    }

    private static var displayWithParameters: String {
        """
        let ratingDisplay = SparkUIRatingDisplay(theme: MyTheme.shared)
        ratingDisplay.value = 3.76
        ratingDisplay.size = .large
        ratingDisplay.stars = .one
        ratingDisplay.text = "(3,76)"
        self.addSubview(ratingDisplay)
        """
    }

    private static var input: String {
        """
        let ratingInput = SparkUIRatingInput(theme: MyTheme.shared)
        ratingInput.value = 3.0
        ratingInput.isEnabled = true
        self.addSubview(ratingInput) 
        """
    }
}
