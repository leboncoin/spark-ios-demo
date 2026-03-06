//
//  TabUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct TabUICodeSyntaxes {

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
        let tab = SparkUITab(
            theme: theme,
            titles: ["Tab 1", "Tab 2", "Tab 3"]
        )
        tab.selectedSegmentIndex = 0
        tab.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }

    private static var full: String {
        """
        let tab = SparkUITab(
            theme: theme,
            titles: ["Home", "Messages", "Profile"]
        )
        tab.selectedSegmentIndex = 0
        tab.intent = .basic
        tab.size = .medium
        tab.apportionsSegmentWidthsByContent = false
        tab.isEnabled = true

        // Add images to segments
        tab.setImage(UIImage(systemName: "house"), forSegmentAt: 0)
        tab.setImage(UIImage(systemName: "message"), forSegmentAt: 1)
        tab.setImage(UIImage(systemName: "person"), forSegmentAt: 2)

        // Add badge to first segment
        let badge = SparkUIBadge(theme: theme)
        badge.intent = .basic
        badge.value = 5
        badge.isBorder = false
        badge.size = .medium
        tab.setExtraView(badge, forSegmentAt: 0)

        tab.addAction(UIAction(handler: { _ in }), for: .valueChanged)
        """
    }
}
