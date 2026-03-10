//
//  SegmentedGaugeUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SegmentedGaugeUICodeSyntaxes {

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
        let segmentedGauge = SparkUISegmentedGauge(theme: theme)
        segmentedGauge.title = "My Segmented Gauge"
        segmentedGauge.segments = [0.25, 0.5, 0.75]
        """
    }

    private static var full: String {
        """
        let segmentedGauge = SparkUISegmentedGauge(theme: theme)
        segmentedGauge.title = "My Segmented Gauge"
        segmentedGauge.descriptionString = "Progress description"
        segmentedGauge.segments = [0.2, 0.4, 0.6, 0.8]
        segmentedGauge.size = .medium
        segmentedGauge.alignment = .leading
        segmentedGauge.withMarker = true
        segmentedGauge.type = .info
        segmentedGauge.accessibilityLabel = "Segmented gauge showing progress"
        """
    }
}
