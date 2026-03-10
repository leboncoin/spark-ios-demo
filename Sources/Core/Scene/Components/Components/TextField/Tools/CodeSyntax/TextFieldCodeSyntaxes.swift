//
//  TextFieldCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextFieldCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.simple),
            .init(title: "Full", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        SparkTextField(
            "Placeholder",
            text: $text,
            theme: theme
        )
        .sparkTextFieldIntent(.neutral)
        """
    }

    private static var full: String {
        """
        SparkTextField(
            "Placeholder",
            text: $text,
            theme: theme,
            leftView: {
                Image(systemName: "magnifyingglass")
            },
            rightView: {
                Image(systemName: "xmark.circle.fill")
                    .onTapGesture { text = "" }
            },
            leftAddon: {
                Text("€")
            },
            rightAddon: {
                Text(".00")
            }
        )
        .sparkTextFieldIntent(.neutral)
        .sparkTextFieldReadOnly(false)
        .sparkTextFieldClearMode(.whileEditing)
        .sparkTextFieldSecureEntry(false)
        .sparkTextFieldLeftAddonConfiguration(hasPadding: true, hasSeparator: true)
        .sparkTextFieldRightAddonConfiguration(hasPadding: true, hasSeparator: true)
        .disabled(false)
        .sparkTextFieldAccessibilityLabel("Text field label")
        """
    }
}
