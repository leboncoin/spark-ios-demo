//
//  SkyTypography.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/08/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import SwiftUI
import UIKit

public struct SkyTypography: Typography {

    // MARK: - Properties

    public let display1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 40,
        style: .bold,
        textStyle: .largeTitle
    )
    public let display2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 32,
        style: .bold,
        textStyle: .largeTitle
    )
    public let display3: any TypographyFontToken = TypographyFontTokenDefault(
        size: 24,
        style: .bold,
        textStyle: .largeTitle
    )

    public let headline1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 20,
        style: .bold,
        textStyle: .headline
    )
    public let headline2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 18,
        style: .bold,
        textStyle: .headline
    )

    public let subhead: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        style: .bold,
        textStyle: .subheadline
    )

    public let body1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        style: .regular,
        textStyle: .body
    )
    public let body1Highlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        style: .medium,
        textStyle: .body
    )

    public let body2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 14,
        style: .regular,
        textStyle: .body
    )
    public let body2Highlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 14,
        style: .medium,
        textStyle: .body
    )

    public let caption: any TypographyFontToken = TypographyFontTokenDefault(
        size: 12,
        style: .regular,
        textStyle: .caption
    )
    public let captionHighlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 12,
        style: .medium,
        textStyle: .caption
    )

    public let small: any TypographyFontToken = TypographyFontTokenDefault(
        size: 10,
        style: .regular,
        textStyle: .footnote
    )
    public let smallHighlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 10,
        style: .medium,
        textStyle: .footnote
    )

    public let callout: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        style: .medium,
        textStyle: .callout
    )

    // MARK: - Initialization

    public init() {}
}

// MARK: - TypographyFont Extension

private extension TypographyFontTokenDefault {

    // MARK: - Constants

    private enum Constants {
        static let regularFontName = "NunitoSans-Regular"
        static let boldFontName = "NunitoSans-Bold"
    }

    // MARK: - Initialization

    init(
        size: CGFloat,
        style: TypographyFontStyle,
        textStyle: TextStyle
    ) {
        self.init(
            names: .init(
                regular: Constants.regularFontName,
                medium: Constants.boldFontName,
                bold: Constants.boldFontName
            ),
            style: style,
            size: size,
            textStyle: textStyle
        )
    }
}
