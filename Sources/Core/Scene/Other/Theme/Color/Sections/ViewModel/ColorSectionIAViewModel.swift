//
//  ColorSectionIAViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 02/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct ColorSectionIAViewModel: ColorSectionViewModelable {

    // MARK: - Properties

    let name: String
    let itemViewModels: [[ColorItemViewModel]]

    // MARK: - Initialization

    init(color: any ColorsIA) {
        self.name = "IA"
        self.itemViewModels = [
            [
                .init(name: "ia", colorToken: color.ia),
                .init(name: "onIA", colorToken: color.onIA),
                .init(name: "iaContainer", colorToken: color.iaContainer),
                .init(name: "onIAContainer", colorToken: color.onIAContainer)
            ]
        ]
    }
}
