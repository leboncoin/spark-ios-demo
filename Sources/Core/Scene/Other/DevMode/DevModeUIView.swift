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

    private let step: Float = 2
    private var lastSnappedValue: Float?

    // MARK: - View

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.label,
//            self.slider,
            self.slider0,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .yellow
        return stackView
    }()

    private var label: UILabel = {
        let label = UILabel()
        label.text = "Replace me with your UI content"
        label.numberOfLines = 0
        return label
    }()

    private lazy var slider0: SteppedSlider = {
        let slider = SteppedSlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.isContinuous = true
        slider.value = 1
        return slider
    }()

    private lazy var slider: SparkUISlider = {
        let slider = SparkUISlider(theme: self.theme.value)
        slider.valueText = "Value"
        slider.minimumRangeValueText = "Min"
        slider.maximumRangeValueText = "Max"
        slider.value = 0.75
        return slider
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

        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            UIView.animate(withDuration: 0.25) {
                self.label.transform = CGAffineTransform(translationX: 20, y: 0)
            }
        })

        slider0.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
//        slider0.addTarget(self, action: #selector(sliderEnded(_:)), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func sliderChanged(_ sender: UISlider) {
//        let snapped = (sender.value / step).rounded() * step
//        if snapped != lastSnappedValue {
//            lastSnappedValue = snapped
//            sender.value = snapped
//        }

        let snapped = (round(sender.value / self.step) * self.step)

        let range = (snapped * 0.99)...(snapped * 1.01)
//        print("LOGROB v:\(sender.value) s:\(self.step) = s:\(snapped) ls:\(lastSnappedValue)")

            print("LOGROB v:\(sender.value) s:\(self.step) = s:\(snapped) ls:\(lastSnappedValue) c:\(range.contains(sender.value))")


        if range.contains(sender.value) {
            self.lastSnappedValue = snapped
            self.slider0.setValue(snapped, animated: false)
        } else if let lastSnappedValue {
            self.slider0.setValue(lastSnappedValue, animated: false)
        }

//        sender.

        label.text = "\(sender.value)"
    }

//    @objc private func sliderEnded(_ sender: UISlider) {
//        let snapped = (sender.value / step).rounded() * step
//        lastSnappedValue = snapped
//        sender.setValue(snapped, animated: false) // important
//    }
}

final class SteppedSlider: UISlider {
    var step: Float = 1
    private var lastSnappedValue: Float?

//    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        let ok = super.continueTracking(touch, with: event)
//        snap(animated: false)
//        return ok
//    }
//
//    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//        super.endTracking(touch, with: event)
//        snap(animated: false)
//        lastSnappedValue = nil
//    }
//
//    private func snap(animated: Bool) {
//        guard step > 0 else { return }
//        let snapped = (value / step).rounded() * step
//        if snapped != lastSnappedValue {
//            lastSnappedValue = snapped
//            setValue(snapped, animated: animated)
//            sendActions(for: .valueChanged)
//        }
//    }
}
