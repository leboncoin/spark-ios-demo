//
//  CardCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CardCodeSyntaxes {

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
        SparkCard(
            content: {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome on Card")
                        .font(.headline)
                    Text("This is the description of the card.")
                        .font(.body)
                }
                .padding(30)
            }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.main)
        .sparkCardVariant(.filled)
        """
    }

    private static var full: String {
        """
        SparkCard(
            content: {
                VStack(alignment: .leading, spacing: .medium) {
                    SparkTag(
                        theme: theme,
                        intent: .main,
                        variant: .filled,
                        text: "Tag"
                    )

                    VStack(alignment: .leading, spacing: .small) {
                        HStack {
                            SparkIcon(
                                theme: theme,
                                intent: .main,
                                size: .medium,
                                iconImage: .spark
                            )

                            Text("Welcome on Card")
                        }

                        Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus.")
                            .multilineTextAlignment(.leading)
                            .truncationMode(.middle)
                    }

                    ButtonView(
                        theme: theme,
                        intent: .main,
                        variant: .filled,
                        size: .medium,
                        alignment: .leadingImage,
                        action: { }
                    )
                    .title("Action", for: .normal)
                }
                .padding(30)
            },
            action: { print("Card tapped") }
        )
        .sparkTheme(theme)
        .sparkCardIntent(.main)
        .sparkCardVariant(.filled)
        .sparkCardIsBackdrop(false)
        .sparkCardIsHighlighted(false)
        .sparkCardIsPadding(true)
        .disabled(false)
        .accessibilityLabel("Card label")
        .accessibilityHidden(false)
        """
    }
}
