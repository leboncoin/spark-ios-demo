//
//  SnackbarConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class SnackbarConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SnackbarIntent = .default
    var alignment: SnackbarAlignment = .default
    var icon: Iconography? = .optionalRandom

    var title: String = "Title"
    var message: String = "Snackbar placeholder"

    var hasButton: Bool = true
    var buttonTitle: String = "Tap"

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondTitleText = "other"
    var swiftUISecondMessageText = "other"

    // MARK: - UIKit Properties Only

    var uiKitIsAttributedTitle: Bool = false
    var uiKitIsAttributedMessage: Bool = false

    // MARK: - Methods

    override func random() {
        self.intent = .random
        self.alignment = .random
        self.icon = .optionalRandom
        self.hasButton = .random()
    }
}
