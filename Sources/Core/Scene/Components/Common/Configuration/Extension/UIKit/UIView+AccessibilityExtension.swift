//
//  UIView+AccessibilityExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 07/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UIView {

    func demoAccessibility<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        self.demoAccessibilityLabel(configuration)
        self.demoAccessibilityValue(configuration)
        self.demoAccessibilityHint(configuration)
    }

    func demoAccessibilityLabel<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        if let value =  configuration.accessibilityLabel.value.nilIfEmpty {
            self.accessibilityLabel = value
        }
    }

    func demoAccessibilityValue<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        if let value = configuration.accessibilityValue.value.nilIfEmpty {
            self.accessibilityValue = value
        }
    }

    func demoAccessibilityHint<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        if let value = configuration.accessibilityHint.value.nilIfEmpty {
            self.accessibilityHint = value
        }
    }
}
