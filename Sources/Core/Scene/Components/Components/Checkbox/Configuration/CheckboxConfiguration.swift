//
//  CheckboxConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class CheckboxConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SparkComponentSelectionControls.CheckboxIntent = .random // TODO: Remove Module prefix
    var alignment: CheckboxAlignment = .random
    var text = "My Checkbox"
    var checkedIcon: Iconography = .random
    var isIndeterminate: Bool = .random()

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "is amazing"

    // MARK: - UIKit Properties Only

    var uiKitSelectionState: SparkComponentSelectionControls.CheckboxSelectionState = .unselected
    var uiKitIsAttributedText: Bool = .random()

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
        self.isEnabled.showConfiguration = true
        self.swiftUIWidth.showConfiguration = true
    }

    // MARK: - Getter

    func getInfoValue(from selectionState: SparkComponentSelectionControls.CheckboxSelectionState) -> String {
        return "Selection state : \(selectionState)"
    }
}
