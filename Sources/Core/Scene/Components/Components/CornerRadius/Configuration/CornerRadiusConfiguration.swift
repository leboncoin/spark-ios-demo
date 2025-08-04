//
//  CornerRadiusConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class CornerRadiusConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var radius: SparkBorder.Radius = .random
    var isHighlighted: Bool = .random()

    // MARK: - SwiftUI Properties Only

    var swiftUIIsScaled: Bool = true

    // MARK: - Style Properties

    lazy var backgroundColor: any ColorToken = {
        self.theme.value.colors.main.main
    }()

    let maxRadius: CGFloat = 24

    lazy var contentSize: CGSize = {
        .init(width: 200, height: self.maxRadius * 2)
    }()
}
