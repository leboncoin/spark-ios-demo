//
//  IconDemoIntent.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

enum IconDemoIntent: CaseIterable {
    case accent
    case alert
    case basic
    case error
    case info
    case main
    case neutral
    case success
    case support
    case custom

    // MARK: - Properties

    /// The default case. Equals to **.basic**.
    static let `default`: Self = {
        switch IconIntent.default {
        case .accent: .accent
        case .alert: .alert
        case .basic: .basic
        case .error: .error
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .custom: .custom
        }
    }()

    // MARK: - Methods

    func toRealType(_ configuration: IconConfiguration) -> IconIntent {
        switch self {
        case .accent: .accent
        case .alert: .alert
        case .basic: .basic
        case .error: .error
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .custom: .custom(configuration.intentCustomColorToken.value(configuration))
        }
    }
}
