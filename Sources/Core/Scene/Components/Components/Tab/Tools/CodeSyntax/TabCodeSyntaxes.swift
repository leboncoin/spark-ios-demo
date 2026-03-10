//
//  TabCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TabCodeSyntaxes {

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
        @State private var selectedTab: Int = 0

        SparkTab(selection: $selectedTab) {
            SparkTabItem(
                tag: 1,
                text: "Tab 1"
            )

            SparkTabItem(
                tag: 2,
                text: "Tab 2"
            )

            SparkTabItem(
                tag: 3,
                text: "Tab 3"
            )
        }
        .sparkTheme(theme)
        """
    }

    private static var full: String {
        """
        @State private var selectedTab: Int = 0

        SparkTab(selection: $selectedTab) {
            SparkTabItem(
                tag: 1,
                text: "Home",
                icon: Image(systemName: "house")
            ) {
                SparkBadge(value: 5)
                    .sparkTheme(theme)
                    .sparkBadgeIntent(.basic)
                    .sparkBadgeSize(.medium)
                    .sparkBadgeIsBorder(false)
            }

            SparkTabItem(
                tag: 2,
                text: "Messages",
                icon: Image(systemName: "message")
            )

            SparkTabItem(
                tag: 3,
                icon: Image(systemName: "person")
            )
        }
        .disabled(false)
        .sparkTheme(theme)
        .sparkTabIntent(.basic)
        .sparkTabSize(.medium)
        .sparkTabApportionsSegmentWidthsByContent(true)
        """
    }
}
