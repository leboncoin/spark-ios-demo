// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// swiftlint:disable all
let package = Package(
    name: "SparkDemo",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SparkDemo",
            targets: ["SparkDemo"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/leboncoin/spark-ios-common.git",
            // path: "../spark-ios-common"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-theming.git",
            // path: "../spark-ios-theming"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-badge.git",
            // path: "../spark-ios-component-badge"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-bottom-sheet.git",
            // path: "../spark-ios-component-bottom-sheet"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-button.git",
            // path: "../spark-ios-component-button"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-chip.git",
            // path: "../spark-ios-component-chip"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-divider.git",
            // path: "../spark-ios-component-divider"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-form-field.git",
            // path: "../spark-ios-component-form-field"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-icon.git",
            // path: "../spark-ios-component-icon"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-popover.git",
            // path: "../spark-ios-component-popover"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-progress-bar.git",
            // path: "../spark-ios-component-progress-bar"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-progress-tracker.git",
            // path: "../spark-ios-component-progress-tracker"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-rating.git",
            // path: "../spark-ios-component-rating"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-segmented-gauge.git",
            // path: "../spark-ios-component-segmented-gauge"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-selection-controls.git",
            // path: "../spark-ios-component-selection-controls"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-slider.git",
            // path: "../spark-ios-component-slider"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-snackbar.git",
            // path: "../spark-ios-component-snackbar"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-spinner.git",
            // path: "../spark-ios-component-spinner"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-stepper.git",
            // path: "../spark-ios-component-stepper"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-tab.git",
            // path: "../spark-ios-component-tab"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-tag.git",
            // path: "../spark-ios-component-tag"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-text-input.git",
            // path: "../spark-ios-component-text-input"
            /*version*/ "0.0.1"..."999.999.999"
        ),
        .package(
            url: "https://github.com/leboncoin/spark-ios-component-text-link.git",
            // path: "../spark-ios-component-text-link"
            /*version*/ "0.0.1"..."999.999.999"
        )
    ],
    targets: [
        .target(
            name: "SparkDemo",
            dependencies: [
                .product(
                    name: "SparkCommon",
                    package: "spark-ios-common"
                ),
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkComponentBadge",
                    package: "spark-ios-component-badge"
                ),
                .product(
                    name: "SparkComponentBottomSheet",
                    package: "spark-ios-component-bottom-sheet"
                ),
                .product(
                    name: "SparkComponentButton",
                    package: "spark-ios-component-button"
                ),
                .product(
                    name: "SparkComponentChip",
                    package: "spark-ios-component-chip"
                ),
                .product(
                    name: "SparkComponentDivider",
                    package: "spark-ios-component-divider"
                ),
                .product(
                    name: "SparkComponentFormField",
                    package: "spark-ios-component-form-field"
                ),
                .product(
                    name: "SparkComponentIcon",
                    package: "spark-ios-component-icon"
                ),
                .product(
                    name: "SparkComponentPopover",
                    package: "spark-ios-component-popover"
                ),
                .product(
                    name: "SparkComponentProgressBar",
                    package: "spark-ios-component-progress-bar"
                ),
                .product(
                    name: "SparkComponentProgressTracker",
                    package: "spark-ios-component-progress-tracker"
                ),
                .product(
                    name: "SparkComponentRating",
                    package: "spark-ios-component-rating"
                ),
                .product(
                    name: "SparkComponentSegmentedGauge",
                    package: "spark-ios-component-segmented-gauge"
                ),
                .product(
                    name: "SparkComponentSelectionControls",
                    package: "spark-ios-component-selection-controls"
                ),
                .product(
                    name: "SparkComponentSnackbar",
                    package: "spark-ios-component-snackbar"
                ),
                .product(
                    name: "SparkComponentSlider",
                    package: "spark-ios-component-slider"
                ),
                .product(
                    name: "SparkComponentSpinner",
                    package: "spark-ios-component-spinner"
                ),
                .product(
                    name: "SparkComponentStepper",
                    package: "spark-ios-component-stepper"
                ),
                .product(
                    name: "SparkComponentTab",
                    package: "spark-ios-component-tab"
                ),
                .product(
                    name: "SparkComponentTag",
                    package: "spark-ios-component-tag"
                ),
                .product(
                    name: "SparkComponentTextInput",
                    package: "spark-ios-component-text-input"
                ),
                .product(
                    name: "SparkComponentTextLink",
                    package: "spark-ios-component-text-link"
                )
            ],
            path: "Sources/Core",
            resources: [
                .process("Resources/Assets.xcassets"),
                .process("Resources/Colors.xcassets")
            ]
        )
    ]
)
