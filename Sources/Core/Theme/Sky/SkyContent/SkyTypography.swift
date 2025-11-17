//
//  SkyTypography.swift
//  Spark
//
//  Created by robin.lemaire on 22/08/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import SwiftUI
import UIKit

public struct SkyTypography: Typography {

    // MARK: - Properties

    public let display1: any TypographyFontToken = RainbowTypographyToken(
        size: 40,
        isHighlighted: true
    )
    public let display2: any TypographyFontToken = RainbowTypographyToken(
        size: 32,
        isHighlighted: true
    )
    public let display3: any TypographyFontToken = RainbowTypographyToken(
        size: 24,
        isHighlighted: true
    )

    public let headline1: any TypographyFontToken = RainbowTypographyToken(
        size: 20,
        isHighlighted: true
    )
    public let headline2: any TypographyFontToken = RainbowTypographyToken(
        size: 18,
        isHighlighted: true
    )

    public let subhead: any TypographyFontToken = RainbowTypographyToken(
        size: 16,
        isHighlighted: true
    )

    public let body1: any TypographyFontToken = RainbowTypographyToken(
        size: 16,
        isHighlighted: false
    )
    public let body1Highlight: any TypographyFontToken = RainbowTypographyToken(
        size: 16,
        isHighlighted: true
    )

    public let body2: any TypographyFontToken = RainbowTypographyToken(
        size: 14,
        isHighlighted: false
    )
    public let body2Highlight: any TypographyFontToken = RainbowTypographyToken(
        size: 14,
        isHighlighted: true
    )

    public let caption: any TypographyFontToken = RainbowTypographyToken(
        size: 12,
        isHighlighted: false
    )
    public let captionHighlight: any TypographyFontToken = RainbowTypographyToken(
        size: 12,
        isHighlighted: true
    )

    public let small: any TypographyFontToken = RainbowTypographyToken(
        size: 10,
        isHighlighted: false
    )
    public let smallHighlight: any TypographyFontToken = RainbowTypographyToken(
        size: 10,
        isHighlighted: true
    )

    public let callout: any TypographyFontToken = RainbowTypographyToken(
        size: 16,
        isHighlighted: true
    )

    // MARK: - Initialization

    public init() {}
}

// MARK: - TypographyFont Extension

private extension TypographyFontTokenDefault {

    // MARK: - Constants

    private enum Constants {
        static let boldFontName = "NunitoSans-Bold"
        static let regularFontName = "NunitoSans-Regular"
    }

    // MARK: - Initialization

    init(
        size: CGFloat,
        isHighlighted: Bool,
        textStyle: TextStyle
    ) {
        self.init(
            isHighlighted: isHighlighted,
            regularFontName: Constants.regularFontName,
            boldFontName: Constants.boldFontName,
            size: size,
            textStyle: textStyle
        )
    }
}

// MARK: - Private Token

private struct RainbowTypographyToken: TypographyFontToken {

    // MARK: - Properties

    let font: Font
    let uiFont: UIFont

    // MARK: - Initialization

    init(
        size: CGFloat,
        isHighlighted: Bool
    ) {
        self.font = .system(
            size: size,
            weight: isHighlighted ? .bold : .regular
        )
        self.uiFont = isHighlighted ? .boldSystemFont(ofSize: size) : .systemFont(ofSize: size)
    }
}
