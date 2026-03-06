//
//  TextLinkCodeSyntax.swift
//  SparkDemo
//
//  Created by robin.lemaire on 19/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextLinkCodeSyntax {

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
        SparkTextLink(
            "My TextLink",
            action: {
                // Your action
            }
        )
        .sparkTheme(MyTheme.shared)
        """
    }

    private static var full: String {
        """
        SparkTextLink(
            "My TextLink",
            image: .init(icon: .spark(.arrowHorizontalLeft)),
            action: {
                // Your action
            }
        )
        .sparkTheme(MyTheme.shared)
        .sparkTextLinkAlignment(.leadingImage)
        .sparkTextLinkHighlightRange(NSRange(location: 0, length: 2))
        .sparkTextLinkIntent(.main)
        .sparkTextLinkTypography(.callout)
        .sparkTextLinkVariant(.underline)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        """
    }
}
