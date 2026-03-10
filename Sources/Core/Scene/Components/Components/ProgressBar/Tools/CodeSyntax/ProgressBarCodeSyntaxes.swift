//
//  ProgressBarCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressBarCodeSyntaxes {

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
        SparkProgressBar(value: 0.5)
            .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        SparkProgressBar(value: 0.75)
            .sparkTheme(theme)
            .sparkProgressBarIntent(.main)
            .sparkProgressBarShape(.square)
            .accessibilityLabel("Progress")
            .accessibilityValue("75%")
        """
    }
}
