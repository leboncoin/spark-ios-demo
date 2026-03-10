//
//  ToggleUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ToggleUICodeSyntaxes {

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
        let toggle = SparkUISwitch(theme: theme)
        toggle.isOn = false
        toggle.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        let toggle = SparkUISwitch(theme: theme)
        toggle.text = "Label"
        toggle.isOn = false
        toggle.setOn(true, animated: true)
        toggle.isEnabled = true
        toggle.accessibilityLabel = "Toggle label"
        toggle.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
