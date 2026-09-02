//
//  DropShadowViewModel.swift
//  SparkDemo
//
//  Created by louis.borlee on 30/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

final class DropShadowViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var itemViewModels = [DropShadowItemViewModel]()

    var theme: (any Theme)? {
        didSet {
            self.updateItemViewModels()
        }
    }

    // MARK: - Methods

    private func updateItemViewModels() {
        guard let dropShadow = self.theme?.elevation.dropShadow else {
            return
        }
        self.itemViewModels = [
            .init(name: "none", shadow: dropShadow.none),
            .init(name: "small", shadow: dropShadow.small),
            .init(name: "default", shadow: dropShadow),
            .init(name: "medium", shadow: dropShadow.medium),
            .init(name: "large", shadow: dropShadow.large),
            .init(name: "extraLarge", shadow: dropShadow.extraLarge)
        ]
    }
}
