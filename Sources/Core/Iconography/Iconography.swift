//
//  Iconography.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

enum Iconography: String, CaseIterable {
    case arrowRight = "ArrowRight"
    case bellOutline = "BellOutline"
    case check = "Check"
    case circleCross = "CircleCrossOutline"
    case cross = "Cross"
    case infoOutline = "InfoOutline"
    case minus = "Minus"
    case plus = "Plus"
    case warningFill = "WarningFill"
}

// MARK: - SwiftUI Extensions

extension Image {

    init(icon iconography: Iconography) {
        self.init(iconography.rawValue, bundle: .module)
    }

    init?(icon iconography: Iconography?) {
        guard let iconography else {
            return nil
        }

        self.init(icon: iconography)
    }
}

extension UIImage {

    // swiftlint:disable force_unwrapping
    convenience init(icon iconography: Iconography) {
        self.init(named: iconography.rawValue, in: .module, compatibleWith: nil)!
    }

    convenience init?(icon iconography: Iconography?) {
        guard let iconography else {
            return nil
        }

        self.init(icon: iconography)
    }
}
