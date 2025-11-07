//
//  SegmentedGaugeConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class SegmentedGaugeConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var type: SegmentedGaugeDemoType = .random
    var typeCustomLevel: Int = 1
    var typeCustomColorToken: ColorTokens = .random
    var segments: SegmentedGaugeSegments = .random
    var size: SegmentedGaugeSize = .random
    var alignment: SegmentedGaugeAlignment = .random
    var isMarker: Bool = Bool.random()
    var title: String = "My Segmented Gauge"
    var description: String = "description"

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomTitle: Bool = false
    var swiftUICustomTitle = "is amazing"

    var swiftUIIsCustomDescription: Bool = false
    var swiftUICustomDescription = "perfect"

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedTitle = false
    var uiKitIsAttributedDescription = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }
}
