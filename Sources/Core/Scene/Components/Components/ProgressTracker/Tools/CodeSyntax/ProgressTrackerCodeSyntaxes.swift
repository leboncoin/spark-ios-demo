//
//  ProgressTrackerCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressTrackerCodeSyntaxes {

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
        ProgressTrackerView(
            theme: theme,
            intent: .main,
            variant: .outlined,
            size: .medium,
            numberOfPages: 5,
            orientation: .horizontal,
            currentPageIndex: $currentPageIndex
        )
        """
    }

    private static var full: String {
        """
        ProgressTrackerView(
            theme: theme,
            intent: .main,
            variant: .outlined,
            size: .medium,
            labels: ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"],
            orientation: .horizontal,
            currentPageIndex: $currentPageIndex
        )
        .interactionState(.enabled)
        .useFullWidth(true)
        .completedIndicatorImage(.init(iconImage: checkmarkImage))
        .disable(true, forIndex: 3)
        .currentPageIndicatorImage(.init(iconImage: starImage), forIndex: 2)
        .indicatorLabel("A", forIndex: 0)
        .indicatorImage(.init(iconImage: iconImage), forIndex: 1)
        .showDefaultPageNumber(true)
        """
    }
}
