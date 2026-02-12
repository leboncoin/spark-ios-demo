//
//  SliderCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SliderCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.simple),
            .init(title: "With Environment", code: Self.simpleWithEnvironment),
            .init(title: "Step", code: Self.step)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        SparkSlider(
            value: self.$value,
            in: 0...1,
            onEditingChanged: { isEditing in
                // Do what you want.
            }
        )
        .sparkTheme(self.theme)
        """
    }

    private static var simpleWithEnvironment: String {
        """
        SparkSlider(
            value: self.$value,
            in: 0...1,
            onEditingChanged: { isEditing in
                // Do what you want.
            }
        )
        .sparkTheme(self.theme)
        .sparkSliderIntent(.main)
        """
    }

    private static var step: String {
        """
        // TODO: 
        """
    }
}
