//
//  SpinnerCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SpinnerCodeSyntaxes {

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
        SpinnerView(
            theme: theme,
            intent: .main,
            spinnerSize: .medium
        )
        """
    }

    private static var full: String {
        """
        SpinnerView(
            theme: theme,
            intent: .main,
            spinnerSize: .medium
        )
        .intent(.success)
        .spinnerSize(.small)
        .frame(width: 50, height: 50)
        .accessibilityIdentifier("my-spinner")
        """
    }
}
