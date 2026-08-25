//
//  TypographyCustomView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct TypographyCustomView: View {

    // MARK: - Properties

    var theme = DemoThemes.shared.mainTheme

    @State private var size: CGFloat = 16
    @State private var style: TypographyFontStyle = .regular
    @State private var textStyle: TextStyle = .body
    @State private var text = "Abg"
    @State private var compareFonts = true

    // MARK: - View

    var body: some View {
        VStack(spacing: .medium) {
            Form {
                Section("Content") {

                    HStack(spacing: .medium) {

                        VStack {
                            self.text(for: self.theme.value)

                            if self.compareFonts {
                                self.fontDescriptionText("new")
                            }
                        }
                        .frame(maxWidth: .infinity)

                        // Show the old fonts
                        if self.compareFonts {

                            Divider()

                            VStack {
                                self.text(for: SkyTheme.shared)
                                self.fontDescriptionText("old")
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }

                Section("Configuration") {
                    SliderConfigurationItemView(
                        name: "size",
                        selectedValue: self.$size,
                        range: 8...100,
                        step: 2,
                        showValue: true
                    )

                    EnumConfigurationItemView(
                        name: "style",
                        values: TypographyFontStyle.allCases,
                        selectedValue: self.$style
                    )

                    EnumConfigurationItemView(
                        name: "textStyle",
                        values: TextStyle.allCases,
                        selectedValue: self.$textStyle
                    )

                    ToggleConfigurationItemView(
                        name: "Compare fonts",
                        isOn: self.$compareFonts
                    )

                    TextFieldConfigurationItemView(
                        name: "text",
                        text: self.$text
                    )
                }
            }

        }
        .navigationBarTitle("Custom Typography")
        .sparkTheme(self.theme.value)
    }

    private func text(for theme: any Theme) -> some View {
        Text(self.text)
            .font(theme.typography.custom(
                size: self.size,
                style: self.style,
                textStyle: self.textStyle
            ))
    }

    private func fontDescriptionText(_ value: String) -> some View {
        Text(value)
            .foregroundStyle(.gray)
            .italic()
    }
}
