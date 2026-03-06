//
//  TextLinkUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 19/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TextLinkUICodeSyntaxes {

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
        let textLink = SparkUITextLink(
            theme: MyTheme.shared
        )
        textLink.text = "My TextLink"
        """
    }

    private static var full: String {
        """
        let textLink = SparkUITextLink(
            theme: MyTheme.shared
        )
        textLink.alignment = .leadingImage
        textLink.intent = .main
        textLink.variant = .underline
        textLink.typography = .callout
        textLink.text = "My TextLink"
        textLink.image = .init(icon: .spark(.arrowHorizontalLeft))
        textLink.textHighlightRange = NSRange(location: 0, length: 2)
        textLink.textLabel.textAlignment = .left
        textLink.textLabel.lineBreakMode = .byTruncatingTail
        textLink.textLabel.numberOfLines = 2
        """
    }
}
