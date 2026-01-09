//
//  CardConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class CardConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CardIntent = .default
    var variant: CardVariant = .default
    var isBackdrop: Bool = false
    var isHighlighted: Bool = false
    var isPadding: Bool = true

    var tag = TagConfiguration()
    var icon = IconConfiguration()
    var button = ButtonConfiguration()

    // MARK: - SwiftUI Properties Only

    var swiftUIWithAction: Bool = false

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedText = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true

        self.uiKitControlType.showConfiguration = true
        self.uiKitControlType.cases = ComponentControlType.classic

        self.tag.size = .medium
        self.tag.intent = .info
        self.tag.icon = .check

        self.icon.size = .medium
        self.icon.intent = .info
        self.icon.icon = .infoOutline

        self.button.contentNormal.title = "Tap"
        self.button.contentHighlighted.title = ""
        self.button.uiKitIsSelected.value = false
        self.button.isEnabled.value = true
        self.button.swiftUIIsFullWidth = false
        self.button.uiKitControlType.value = .action
    }

    // MARK: - Getter

    override func isInvertedBackground() -> Bool {
        if self.variant == .outlined {
            return false
        } else if !self.isBackdrop, self.intent != .surface {
            return false
        } else {
            return true
        }
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.isBackdrop = .random()
        self.isHighlighted = .random()
        self.isPadding = .random()
        self.variant = .random
    }
}
