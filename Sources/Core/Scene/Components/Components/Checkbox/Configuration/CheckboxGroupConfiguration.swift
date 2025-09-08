//
//  CheckboxGroupConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class CheckboxGroupConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: SparkComponentSelectionControls.CheckboxIntent = .random // TODO: Remove Module prefix
    var axis: CheckboxGroupAxis = .random
    var title = "My Title Group"
    var selectedIcon: Iconography = .check

    var numberOfItems: Int = Int.random(in: 2...3) {
        didSet {
            self.updateItems()
        }
    }
    var items = [Item]()

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.updateItems()

        self.isEnabled.showConfiguration = true
        self.swiftUIWidth.showConfiguration = true
    }

    // MARK: - Update

    func updateItems() {
        let lastNumberOfItems = self.items.count
        if self.numberOfItems > lastNumberOfItems {
            repeat {
                self.items.append(Item(id: self.items.count + 1))
            } while self.numberOfItems > self.items.count
        } else if self.numberOfItems < lastNumberOfItems {
            self.items.removeLast()
        }
    }

    func resetSelection(on items: inout [any CheckboxGroupItemProtocol]) {
        for (index, _) in items.enumerated() {
            items[index].selectionState = .unselected
        }
    }

    // MARK: - Getter

    func getInfoValue(from selectedIDs: [Int]) -> String {
        if !selectedIDs.isEmpty {
            "SelectedIDs :" + selectedIDs.sorted().map { "\($0)" }.joined(separator: ", ")
        } else {
            "No selection"
        }
    }
}

// MARK: - Sub Model

extension CheckboxGroupConfiguration {
    struct Item: Identifiable, Equatable {

        // MARK: - Properties

        let id: Int
        var isLongText: Bool = false
        var isAttributedText: Bool = false
        var isEnabled: Bool = true

        // MARK: - SwiftUI Properties Only

        var swiftUISecondText = "is amazing"

        // MARK: - Conversion

        func getText() -> String {
            return if self.isLongText {
                "Quisque viverra tincidunt diam sed eleifend. Phasellus malesuada vitae dui a pharetra. Aliquam sagittis tincidunt dolor, non aliquam quam vestibulum nec."
            } else {
                "My item \(self.id)"
            }
        }

        // TODO: Remove after checkbox refactoring
        func toSpark(for framework: Framework) -> CheckboxGroupItemDefault {
            let isAttributedTitleCondition = (framework.isUIKit && self.isAttributedText)

            let text = if self.isLongText {
                "Quisque viverra tincidunt diam sed eleifend. Phasellus malesuada vitae dui a pharetra. Aliquam sagittis tincidunt dolor, non aliquam quam vestibulum nec."
            } else {
                "My item \(self.id)"
            }

            return CheckboxGroupItemDefault(
                title: isAttributedTitleCondition ? nil : text,
                attributedTitle: isAttributedTitleCondition ? text.demoNSAttributedString : nil,
                id: String(self.id),
//                selectionState: self.selectionState,
                selectionState: .indeterminate,
                isEnabled: self.isEnabled
            )
        }
    }
}

// MARK: - Extension

extension CheckboxGroupLayout: @retroactive CaseIterable {

    public static var allCases: [CheckboxGroupLayout] = [
        .vertical,
        .horizontal
    ]
}
