//
//  DevModeUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct DevModeUIViewRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = DevModeUIViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        .init()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

// MARK: - View

final class DevModeUIViewController: UIViewController {

    // MARK: - View

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.label,
            self.component,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var label: UILabel = {
        let label = UILabel()
        label.text = "Replace me with your UI content"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var component: SparkUIChip = {
        let extraContent = SparkUIBadge(theme: self.theme.value)
        extraContent.intent = .danger
        extraContent.value = 43
        extraContent.size = .small

        let componentView = SparkUIChip(theme: self.theme.value)
        componentView.intent = .main
        componentView.variant = .tinted
        componentView.alignment = .leadingIcon
        componentView.icon = .init(icon: .bellOutline)
        componentView.addAction(.init(handler: { _ in
        }), for: .touchUpInside)
        componentView.extraContent = extraContent
        componentView.text = "My Text"
        componentView.isSelected = false
        return componentView
    }()

    private lazy var component2: SparkUISegmentedGauge = {
        let segmentedGauge = SparkUISegmentedGauge(
            theme: self.theme.value
        )
        segmentedGauge.alignment = .horizontal
        segmentedGauge.isMarker = true
        segmentedGauge.segments = .five
        segmentedGauge.size = .small
        segmentedGauge.type = .medium
        segmentedGauge.title = "Hello"
        segmentedGauge.descriptionString = "Description"
        return segmentedGauge
    }()

    // MARK: - Properties

    var theme = DemoThemes.shared.mainTheme

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)

        // Add Subview
        self.view.addSubview(self.contentStackView)

        // Constraints
        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self.view,
            insets: .init(all: .large)
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
