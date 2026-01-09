//
//  DevModeUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

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
            self.roundedView,
            self.rounded2View,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
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

    private var roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var rounded2View: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
            to: self.view
        )

        NSLayoutConstraint.size(
            .init(value: 160),
            from: self.roundedView
        )

        NSLayoutConstraint.size(
            .init(value: 160),
            from: self.rounded2View
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.roundedView.layer.cornerRadius = 10
        self.roundedView.layer.borderWidth = 4
        self.roundedView.layer.borderColor = UIColor.blue.cgColor
        self.roundedView.layer.cornerCurve = .circular

        self.rounded2View.layer.cornerRadius = 10
        self.rounded2View.layer.borderWidth = 4
        self.rounded2View.layer.borderColor = UIColor.blue.cgColor
        self.rounded2View.layer.cornerCurve = .continuous
    }
}
