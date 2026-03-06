//
//  ProgressBarUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressBarUICodeSyntaxes {

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
        let progressBar = SparkUIProgressBar(theme: theme)
        progressBar.value = 0.5
        """
    }

    private static var full: String {
        """
        let progressBar = SparkUIProgressBar(theme: theme)
        progressBar.value = 0.75
        progressBar.intent = .main
        progressBar.shape = .square
        progressBar.accessibilityLabel = "Progress"
        progressBar.accessibilityValue = "75%"
        """
    }
}
