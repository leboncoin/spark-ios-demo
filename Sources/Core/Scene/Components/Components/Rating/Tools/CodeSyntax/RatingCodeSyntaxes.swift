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
            .init(title: "Display", code: Self.display),
            .init(title: "Display with environment", code: Self.displayWithEnvironment),
            .init(title: "Display with text", code: Self.displayWithText),
            .init(title: "Display with label", code: Self.displayWithLabel),
            .init(title: "Input", code: Self.input)
        ]
    }()

    // MARK: - Private Properties

    private static var display: String {
        """
        SparkRatingDisplay(value: 2.75)
            .sparkTheme(MyTheme.shared)
        """
    }

    private static var displayWithEnvironment: String {
        """
        SparkRatingDisplay(value: 2.75)
            .sparkTheme(MyTheme.shared)
            .sparkRatingDisplaySize(.small)
            .sparkRatingDisplayStars(.one)
        """
    }

    private static var displayWithText: String {
        """
        SparkRatingDisplay(
            value: 2.75,
            text: "(2,75)"
        )
        .sparkTheme(MyTheme.shared)
        .sparkRatingDisplaySize(.small)
        .sparkRatingDisplayStars(.one)
        """
    }

    private static var displayWithLabel: String {
        """
        SparkRatingDisplay(
            value: 2.75,
            label: {
                VStack {
                    Text("2").bold()
                    Text("/")
                    Text("5")
                }
            }
        )
        .sparkTheme(MyTheme.shared)
        .sparkRatingDisplaySize(.small)
        .sparkRatingDisplayStars(.one)
        """
    }

    private static var input: String {
        """
        @State var value: Double = 3.0
        
        SparkRatingInput(value: self.$value)
            .sparkTheme(MyTheme.shared)
            .disabled(false)
        """
    }
}
