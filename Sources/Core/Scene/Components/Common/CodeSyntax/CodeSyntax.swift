//
//  CodeSyntax.swift
//  SparkDemo
//
//  Created by robin.lemaire on 12/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: Add Figma link copy past button to computer (async)
// TODO: Add DOcC link to copy past to computer (async)

// TODO:

/*

struct CodeSyntax {

    static func highlight(_ code: String) -> AttributedString {
        var attributed = AttributedString(code)

        // Styles
        let keywordColor = SwiftUI.Color.purple
        let typeColor = SwiftUI.Color.blue
        let stringColor = SwiftUI.Color.red
        let commentColor = SwiftUI.Color.green

        // Regex patterns
        let keywords = #"\b(let|var|func|struct|class|enum|protocol|import|if|else|for|while|return|in)\b"#
        let types = #"\b(String|Int|Double|Float|Bool|Array|Dictionary|Set)\b"#
        let sparkTypes = #"Spark[a-zA-Z0-9_]*"#
        let strings = #"\".*?\""#          // "String literals"
        let comments = #"//.*"#            // Single-line comments

        highlightPattern(keywords, in: &attributed, color: keywordColor)
        highlightPattern(types, in: &attributed, color: typeColor)
        highlightPattern(sparkTypes, in: &attributed, color: typeColor)
        highlightPattern(strings, in: &attributed, color: stringColor)
        highlightPattern(comments, in: &attributed, color: commentColor)

        return attributed
    }

    private static func highlightPattern(
        _ pattern: String,
        in attributed: inout AttributedString,
        color: SwiftUI.Color
    ) {
        let string = String(attributed.characters)
        let regex = try! NSRegularExpression(pattern: pattern)
        let nsRange = NSRange(string.startIndex..<string.endIndex, in: string)

        regex.enumerateMatches(in: string, range: nsRange) { match, _, _ in
            guard let range = match?.range,
                  let swiftRange = Range(range, in: string),
                  let lower = AttributedString.Index(swiftRange.lowerBound, within: attributed),
                  let upper = AttributedString.Index(swiftRange.upperBound, within: attributed)
            else { return }

            let attrRange = lower..<upper
            attributed[attrRange].foregroundColor = color
            attributed[attrRange].font = .system(.body, design: .monospaced)
        }
    }
}

let swiftUIComponents: [String] = [
    // Protocols / bases
    "View", "App", "Scene",

    // Conteneurs de layout
    "VStack", "HStack", "ZStack",
    "LazyVStack", "LazyHStack",
    "LazyVGrid", "LazyHGrid",
    "List", "Form", "Group", "GroupBox",
    "ScrollView", "ScrollViewReader",

    // Navigation
    "NavigationView", "NavigationStack", "NavigationSplitView",
    "NavigationLink",
    "TabView",
    "NavigationPath",

    // Contrôles
    "Text", "Label", "Image",
    "Button", "Toggle", "Slider", "Stepper",
    "TextField", "SecureField", "DatePicker", "ColorPicker",
    "Picker", "Menu",
    "ProgressView",

    // Présentations / overlays
    "Alert", "Sheet", "Popover", "ConfirmationDialog",

    // List-related
    "Section", "ForEach",

    // Autres vues fréquentes
    "Spacer", "Divider",
    "Map", // si tu utilises MapKit SwiftUI
    "AsyncImage",

    // Modificateurs de style / environnement
    "GeometryReader",
    "AnyView",

    // Animations / dessins
    "Canvas",
    "TimelineView",
    "PhaseAnimator",

    // App entry
    "WindowGroup"
]

let uiKitComponents: [String] = [
    // Bases
    "UIResponder", "UIApplication", "UIApplicationDelegate",
    "UIWindow",

    // Vues de base
    "UIView", "UIControl", "UILabel", "UIButton", "UIImageView",
    "UITextField", "UITextView", "UISwitch", "UISlider",
    "UIStepper", "UIProgressView", "UIActivityIndicatorView",

    // Containers
    "UIViewController", "UINavigationController", "UITabBarController",
    "UISplitViewController", "UIPageViewController",

    // Table & collection
    "UITableView", "UITableViewCell",
    "UICollectionView", "UICollectionViewCell", "UICollectionReusableView",

    // Barres & items
    "UINavigationBar", "UIToolbar", "UITabBar", "UITabBarItem",
    "UIBarButtonItem",

    // Scroll & input
    "UIScrollView", "UIStackView",
    "UIPickerView", "UIDatePicker",
    "UISearchBar", "UISearchController",

    // Alertes & présentations
    "UIAlertController", "UIAlertAction",

    // AutoLayout & dessin
    "NSLayoutConstraint", "UILayoutGuide",
    "UIBezierPath", "CAShapeLayer",

    // Gesture
    "UIGestureRecognizer",
    "UITapGestureRecognizer", "UIPanGestureRecognizer",
    "UIPinchGestureRecognizer", "UIRotationGestureRecognizer",
    "UILongPressGestureRecognizer", "UISwipeGestureRecognizer",

    // Autres utilitaires fréquents
    "UIColor", "UIFont", "UIImage", "UIScreen", "UIDevice"
]
*/
