//
//  SegmentedGaugeCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SegmentedGaugeCodeSyntaxes {

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
        SparkSegmentedGauge("My Segmented Gauge")
            .sparkTheme(theme)
            .sparkSegmentedGaugeSegments([0.25, 0.5, 0.75])
        """
    }

    private static var full: String {
        """
        SparkSegmentedGauge(
            "My Segmented Gauge",
            description: "Progress description"
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeSegments([0.2, 0.4, 0.6, 0.8])
        .sparkSegmentedGaugeSize(.medium)
        .sparkSegmentedGaugeAlignment(.leading)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeType(.info)
        .accessibilityLabel("Segmented gauge showing progress")
        """
    }
}
