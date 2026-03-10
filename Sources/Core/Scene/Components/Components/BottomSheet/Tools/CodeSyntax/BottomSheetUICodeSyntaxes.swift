//
//  BottomSheetUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BottomSheetUICodeSyntaxes {

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
        import UIKit

        class ViewController: UIViewController {
            override func viewDidLoad() {
                super.viewDidLoad()

                let button = UIButton(configuration: .filled())
                button.setTitle("Show Bottom Sheet", for: .normal)
                button.addAction(UIAction { [weak self] _ in
                    self?.showBottomSheet()
                }, for: .touchUpInside)

                view.addSubview(button)
                button.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
            }

            private func showBottomSheet() {
                let controller = BottomSheetViewController()

                if let sheet = controller.sheetPresentationController {
                    sheet.detents = [.medium()]
                    sheet.prefersGrabberVisible = true
                }

                present(controller, animated: true)
            }
        }

        class BottomSheetViewController: UIViewController {
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .systemBackground

                let titleLabel = UILabel()
                titleLabel.text = "Bottom Sheet"
                titleLabel.font = .boldSystemFont(ofSize: 24)

                let textLabel = UILabel()
                textLabel.text = "This is a simple bottom sheet example."
                textLabel.numberOfLines = 0
                textLabel.textAlignment = .center

                let dismissButton = UIButton(configuration: .filled())
                dismissButton.setTitle("Dismiss", for: .normal)
                dismissButton.addAction(UIAction { [weak self] _ in
                    self?.dismiss(animated: true)
                }, for: .touchUpInside)

                let stackView = UIStackView(arrangedSubviews: [titleLabel, textLabel, dismissButton])
                stackView.axis = .vertical
                stackView.spacing = 16
                stackView.translatesAutoresizingMaskIntoConstraints = false

                view.addSubview(stackView)
                NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
                    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                ])
            }
        }
        """
    }

    private static var full: String {
        """
        import UIKit

        class ViewController: UIViewController {
            override func viewDidLoad() {
                super.viewDidLoad()

                let button = UIButton(configuration: .filled())
                button.setTitle("Show Bottom Sheet", for: .normal)
                button.addAction(UIAction { [weak self] _ in
                    self?.showBottomSheet()
                }, for: .touchUpInside)

                view.addSubview(button)
                button.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
            }

            private func showBottomSheet() {
                let controller = BottomSheetViewController()

                // Configure sheet presentation with multiple detents
                if let sheet = controller.sheetPresentationController {
                    sheet.detents = [
                        .medium(),
                        .large(),
                        .custom(resolver: { context in
                            return context.maximumDetentValue * 0.75
                        })
                    ]
                    sheet.prefersScrollingExpandsWhenScrolledToEdge = true
                    sheet.prefersGrabberVisible = true
                    sheet.prefersEdgeAttachedInCompactHeight = true
                    sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
                }

                present(controller, animated: true)
            }
        }

        class BottomSheetViewController: UIViewController {
            private lazy var scrollView: UIScrollView = {
                let scrollView = UIScrollView()
                scrollView.showsVerticalScrollIndicator = true
                scrollView.translatesAutoresizingMaskIntoConstraints = false
                return scrollView
            }()

            private lazy var contentStackView: UIStackView = {
                let stackView = UIStackView(arrangedSubviews: [
                    titleLabel,
                    subtitleLabel,
                    textLabel,
                    UIView(),
                    dismissButton
                ])
                stackView.axis = .vertical
                stackView.spacing = 16
                stackView.translatesAutoresizingMaskIntoConstraints = false
                return stackView
            }()

            private let titleLabel: UILabel = {
                let label = UILabel()
                label.text = "Bottom Sheet"
                label.font = .boldSystemFont(ofSize: 24)
                label.numberOfLines = 0
                return label
            }()

            private let subtitleLabel: UILabel = {
                let label = UILabel()
                label.text = "With ScrollView"
                label.font = .systemFont(ofSize: 18, weight: .medium)
                label.numberOfLines = 0
                return label
            }()

            private let textLabel: UILabel = {
                let label = UILabel()
                label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris."
                label.numberOfLines = 0
                label.textAlignment = .center
                return label
            }()

            private lazy var dismissButton: UIButton = {
                let button = UIButton(configuration: .filled())
                button.setTitle("Dismiss", for: .normal)
                button.addAction(UIAction { [weak self] _ in
                    self?.dismiss(animated: true)
                }, for: .touchUpInside)
                button.heightAnchor.constraint(equalToConstant: 44).isActive = true
                return button
            }()

            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .systemBackground

                scrollView.addSubview(contentStackView)
                view.addSubview(scrollView)

                NSLayoutConstraint.activate([
                    scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
                    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),

                    contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

                    scrollView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
                ])
            }
        }
        """
    }
}
