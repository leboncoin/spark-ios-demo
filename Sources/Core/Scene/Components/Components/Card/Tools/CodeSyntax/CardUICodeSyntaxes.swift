//
//  CardUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct CardUICodeSyntaxes {

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
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 16

        let titleLabel = UILabel()
        titleLabel.text = "Welcome on Card"
        titleLabel.font = theme.typography.headline2.uiFont
        titleLabel.numberOfLines = 0

        let descriptionLabel = UILabel()
        descriptionLabel.text = "This is the description of the card."
        descriptionLabel.font = theme.typography.body1.uiFont
        descriptionLabel.numberOfLines = 0

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)

        let card = SparkUICard(
            theme: theme,
            contentView: contentStackView
        )
        card.intent = .main
        card.variant = .filled
        """
    }

    private static var full: String {
        """
        // Create tag
        let tag = SparkUITag(
            theme: theme,
            intent: .main,
            variant: .filled,
            text: "Tag"
        )

        // Create title with icon
        let titleStackView = UIStackView()
        titleStackView.axis = .horizontal
        titleStackView.spacing = 8

        let icon = SparkUIIcon(
            theme: theme,
            intent: .main,
            size: .medium,
            iconImage: .spark
        )

        let titleLabel = UILabel()
        titleLabel.text = "Welcome on Card"
        titleLabel.font = theme.typography.headline2.uiFont
        titleLabel.numberOfLines = 0

        titleStackView.addArrangedSubview(icon)
        titleStackView.addArrangedSubview(titleLabel)

        // Create description
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus."
        descriptionLabel.font = theme.typography.body1.uiFont
        descriptionLabel.numberOfLines = 0

        // Create text stack view
        let textStackView = UIStackView(arrangedSubviews: [
            titleStackView,
            descriptionLabel
        ])
        textStackView.axis = .vertical
        textStackView.spacing = Spacing.small.rawValue

        // Create button
        let button = ButtonUIView(
            theme: theme,
            intent: .main,
            variant: .filled,
            size: .medium,
            alignment: .leadingImage
        )
        button.addAction(UIAction(handler: { _ in print("Button tapped") }), for: .touchUpInside)
        button.setTitle("Action", for: .normal)

        // Create content stack view
        let contentStackView = UIStackView(arrangedSubviews: [
            tag,
            textStackView,
            button
        ])
        contentStackView.axis = .vertical
        contentStackView.spacing = Spacing.medium.rawValue

        // Create card
        let card = SparkUICard(
            theme: theme,
            contentView: contentStackView
        )
        card.intent = .main
        card.variant = .filled
        card.isBackdrop = false
        card.isHighlightedStyle = false
        card.isPadding = true
        card.isEnabled = true
        card.accessibilityLabel = "Card label"
        """
    }
}
