//
//  SpinnerUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SpinnerUICodeSyntaxes {

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
        let spinner = SpinnerUIView(
            theme: theme,
            intent: .main,
            spinnerSize: .medium
        )
        """
    }

    private static var full: String {
        """
        let spinner = SpinnerUIView(
            theme: theme,
            intent: .main,
            spinnerSize: .medium
        )
        spinner.theme = theme
        spinner.intent = .success
        spinner.spinnerSize = .small
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.accessibilityIdentifier = "my-spinner"
        """
    }
}
