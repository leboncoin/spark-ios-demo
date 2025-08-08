//
//  View+AccessibilityExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    @ViewBuilder
    func demoAccessibilityLabel<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        let value = configuration.accessibilityLabel.value
        if !value.isEmpty {
            self.accessibilityLabel(value)
                .sparkAccessibilityLargeContentText(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityValue<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        let value = configuration.accessibilityValue.value
        if !value.isEmpty {
            self.accessibilityValue(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityHint<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        let value = configuration.accessibilityHint.value
        if !value.isEmpty {
            self.accessibilityHint(value)
        } else {
            self
        }
    }
}
