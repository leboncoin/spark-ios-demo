//
//  ProgressTrackerUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct ProgressTrackerUICodeSyntaxes {

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
        let progressTracker = ProgressTrackerUIControl(
            theme: theme,
            intent: .main,
            variant: .outlined,
            numberOfPages: 5,
            orientation: .horizontal
        )
        progressTracker.size = .medium
        progressTracker.currentPageIndex = 2
        """
    }

    private static var full: String {
        """
        let progressTracker = ProgressTrackerUIControl(
            theme: theme,
            intent: .main,
            variant: .outlined,
            labels: ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"],
            orientation: .horizontal
        )
        progressTracker.size = .medium
        progressTracker.interactionState = .enabled
        progressTracker.currentPageIndex = 2
        progressTracker.setCompletedIndicatorImage(.init(iconImage: checkmarkImage))
        progressTracker.setIsEnabled(false, forIndex: 3)
        progressTracker.setCurrentPageIndicatorImage(.init(iconImage: starImage), forIndex: 2)
        progressTracker.setLabel("Custom Label", forIndex: 0)
        progressTracker.setAttributedLabel(attributedString, forIndex: 1)
        progressTracker.setIndicatorLabel("A", forIndex: 0)
        progressTracker.setIndicatorImage(.init(iconImage: iconImage), forIndex: 1)
        progressTracker.showDefaultPageNumber = true
        """
    }
}
