//
//  TextFieldConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

class TextFieldConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: TextFieldIntent = .random
    var placeholder: String = "My placeholder"
    var isSecure: Bool = false
    var isReadOnly = false
    var leftViewContentType: TextFieldSideViewContentType = .random
    // TODO: remettre
//    var rightViewContentType: TextFieldSideViewContentType = .random
    var rightViewContentType: TextFieldSideViewContentType = .none

    // MARK: - SwiftUI Properties Only

    // TODO: remettre
//    var swiftUIClearButtonMode: TextFieldClearMode = .random
    var swiftUIClearButtonMode: TextFieldClearMode = .always

    // MARK: - UIKit Properties Only

    var uiKitLeftViewMode: UITextField.ViewMode = .random
    // TODO: remettre
//    var uiKitRightViewMode: UITextField.ViewMode = .random
//    var uiKitClearButtonMode: UITextField.ViewMode = .random
    var uiKitRightViewMode: UITextField.ViewMode = .never
    var uiKitClearButtonMode: UITextField.ViewMode = .always

    // MARK: - Initialization

    required init() {
        super.init()

        self.uiKitControlType.value = .action

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }
}

// MARK: - Extension

extension UITextField.ViewMode: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public static var allCases: [Self] = [
        .never,
        .whileEditing,
        .unlessEditing,
        .always
    ]

    public var description: String {
        switch self {
        case .never: "Never"
        case .whileEditing: "While Editing"
        case .unlessEditing: "Unless Editing"
        case .always: "Always"
        @unknown default: ""
        }
    }
}
