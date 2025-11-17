//
//  ColorTokens.swift
//  SparkDemo
//
//  Created by robin.lemaire on 09/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

enum ColorTokens: String, CaseIterable {
    case accent
    case alert
    case basic
    case error
    case info
    case main
    case neutral
    case success
    case support

    // MARK: - Methods

    func value(_ configuration: ComponentConfiguration) -> any ColorToken {
        let colors = configuration.theme.value.colors

        return switch self {
        case .accent: colors.accent.accent
        case .alert: colors.feedback.alert
        case .basic: colors.basic.basic
        case .error: colors.feedback.error
        case .info: colors.feedback.info
        case .main: colors.main.main
        case .neutral: colors.feedback.neutral
        case .success: colors.feedback.success
        case .support: colors.support.support
        }
    }
}
