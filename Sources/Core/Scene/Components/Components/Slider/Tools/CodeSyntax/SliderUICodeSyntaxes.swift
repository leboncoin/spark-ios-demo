//
//  SliderUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SliderUICodeSyntaxes {

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
        let slider = SparkUISlider(theme: theme)
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        let slider = SparkUISlider(theme: theme)
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.step = 10
        slider.intent = .support
        slider.isContinuous = true
        slider.isFloatingValueLabel = true
        slider.isEnabled = true

        slider.title = "Volume"
        slider.valueText = "0"
        slider.minimumRangeValueText = "0"
        slider.maximumRangeValueText = "100"

        slider.accessibilityLabel = "Volume slider"

        slider.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
