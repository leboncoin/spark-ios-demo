//
//  SnackbarPresentationConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class SnackbarPresentationConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var autoDismissDelay: SnackbarAutoDismissDelay? = .optionalRandom

    // MARK: - UIKit Properties Only

    var uiKitIsAnimated: Bool = true

    // MARK: - Methods

    override func random() {
        self.autoDismissDelay = .optionalRandom
        self.uiKitIsAnimated = .random()
    }
}
