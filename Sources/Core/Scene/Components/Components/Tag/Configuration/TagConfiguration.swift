//
//  TagConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 17/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class TagConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: TagIntent = .random
    var variant: TagVariant = .random
    var icon: Iconography? = .optionalRandom
    var text = "My Tag"
    var isAttributedText = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        self.intent == .surface
    }
}
