//
//  ComponentsView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct ComponentsView: View {

    // MARK: - Properties

    let framework: Framework
    @State private var accessibilityStatus: AccessibilityStatus = .all
    @State private var familly: Familly = .all
    @State private var searchText = ""

    var searchResults: [Component] {
        let allCases = Component.allCases(
            for: self.framework,
            familly: self.familly,
            accessibilityStatus: self.accessibilityStatus
        )

        let filteredResults = if self.searchText.isEmpty {
            allCases
        } else {
            allCases.filter {
                $0.name.localizedLowercase.contains(self.searchText.localizedLowercase) ||
                $0.familly.name.localizedLowercase.contains(self.searchText.localizedLowercase)
            }
        }

        return filteredResults.sorted(by: { $0.rawValue < $1.rawValue })
    }

    // MARK: - View

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(self.searchResults, id: \.self) { component in
                        NavigationLink(value: component) {
                            HStack(alignment: .bottom) {

                                component.illustrationView
                                    .frame(width: 100, height: 100)

                                VStack(alignment: .leading, spacing: .small) {

                                    Text(component.name)
                                        .font(.title2)
                                        .bold()
                                        .foregroundStyle(Color.level1)

                                    HStack {
                                        Text(component.familly.name)
                                            .font(.footnote)
                                            .italic()
                                            .padding(.vertical, 2)
                                            .padding(.horizontal, 4)
                                            .background {
                                                RoundedRectangle(cornerRadius: 4)
                                                    .fill(Color.level1)
                                            }

                                        if component.accessibilityStatus.isAccessibility {
                                            Image(systemName: "accessibility")
                                                .foregroundColor(component.accessibilityStatus.color)
                                        }
                                    }
                                }
                            }
                            .foregroundStyle(.background)
                        }
                    }
                } footer: {
                    Text("\(self.searchResults.count) components")
                }

                Section {
                    NavigationLink("Dev Mode") {
                        switch self.framework {
                        case .uiKit:
                            DevModeUIViewRepresentable()
                                .navigationBarTitle("Dev Mode")

                        case .swiftUI:
                            DevModeView()
                                .navigationBarTitle("Dev Mode")
                        }
                    }
                }
            }
            .navigationDestination(for: Component.self, destination: { component in
                switch self.framework {
                case .uiKit:
                    self.uiKitComponent(component)
                        .background(Color(.systemGroupedBackground))
                        .navigationBarTitle(component.name)

                case .swiftUI:
                    self.swiftUIComponent(component)
                        .navigationBarTitle(component.name)
                }
            })
            .navigationBarTitle(self.framework.name)
            .searchable(text: self.$searchText)
            .toolbar {
                Menu("Settings", systemImage: "slider.horizontal.3") {
                    Picker("Select the familly of the components", selection: self.$familly) {
                        ForEach(Familly.allCases, id: \.rawValue) { familly in
                            Text(familly.name)
                                .tag(familly)
                        }
                    }

                    ControlGroup {
                        ForEach(AccessibilityStatus.allCases.filter { $0 != .none }, id: \.rawValue) { status in
                            Button(
                                status.name,
                                systemImage: status == self.accessibilityStatus ? "accessibility.fill" : "accessibility"
                            ) {
                                self.accessibilityStatus = status
                            }
                            .tint(status.color)
                        }
                    }
                }
            }
        }
    }

    // MARK: - SwiftUI Components

    @ViewBuilder
    private func swiftUIComponent(_ component: Component) -> some View {
        switch component {
        case .adaptativeStack: AdaptativeStackComponentView()
        case .badge: BadgeComponentView()
        case .border: BorderComponentView()
        case .borderRadius: BorderRadiusComponentView()
        case .bottomSheet: BottomSheetComponentView()
        case .button: ButtonComponentView()
        case .checkbox: CheckboxComponentView()
        case .checkboxGroup: CheckboxGroupComponentView()
        case .chip: ChipComponentView()
        case .cornerRadius: CornerRadiusComponentView()
        case .divider: DividerComponentView()
        case .formField: FormFieldComponentView()
        case .icon: IconComponentView()
        case .iconButton: IconButtonComponentView()
        case .microAnimation: MicroAnimationComponentView()
        case .popover: PopoverComponentView()
        case .progressBar: ProgressBarComponentView()
        case .progressBarIndeterminate: ProgressBarIndeterminateComponentView()
        case .progressTracker: ProgressTrackerComponentView()
        case .radioButton: RadioButtonComponentView()
        case .radioGroup: RadioGroupComponentView()
        case .ratingDisplay: RatingDisplayComponentView()
        case .ratingInput: RatingInputComponentView()
        case .segmentedGauge: SegmentedGaugeComponentView()
        case .slider: SliderComponentView()
        case .snackbar: SnackbarComponentView()
        case .snackbarPresentation: SnackbarPresentationComponentView()
        case .spinner: SpinnerComponentView()
        case .stepper: StepperComponentView()
        case .tab: TabComponentView()
        case .tag: TagComponentView()
        case .textEditor: TextEditorComponentView()
        case .textField: TextFieldComponentView()
        case .textLink: TextLinkComponentView()
        case .toggle: ToggleComponentView()
        default: EmptyView()
        }
    }

    // MARK: - UIKit Components

    @ViewBuilder
    private func uiKitComponent(_ component: Component) -> some View {
        switch component {
        case .adaptativeStack: AdaptativeStackComponentUIViewController()
        case .badge: BadgeComponentUIViewController()
        case .borderRadius: BorderRadiusComponentUIViewController()
        case .button: ButtonComponentUIViewController()
        case .bottomSheet: BottomSheetComponentUIViewController()
        case .checkbox: CheckboxComponentUIViewController()
        case .checkboxGroup: CheckboxGroupComponentUIViewController()
        case .chip: ChipComponentUIViewController()
        case .cornerRadius: CornerRadiusComponentUIViewController()
        case .divider: DividerComponentUIViewController()
        case .formField: FormFieldComponentUIViewController()
        case .icon: IconComponentUIViewController()
        case .iconButton: IconButtonComponentUIViewController()
        case .microAnimation: MicroAnimationComponentUIViewController()
        case .popover: PopoverComponentUIViewController()
        case .progressBar: ProgressBarComponentUIViewController()
        case .progressBarIndeterminate: ProgressBarIndeterminateComponentUIViewController()
        case .progressTracker: ProgressTrackerComponentUIViewController()
        case .radioButton: RadioButtonComponentUIViewController()
        case .radioGroup: RadioGroupComponentUIViewController()
        case .ratingDisplay: RatingDisplayComponentUIViewController()
        case .ratingInput: RatingInputComponentUIViewController()
        case .segmentedGauge: SegmentedGaugeComponentUIViewController()
        case .slider: SliderComponentUIViewController()
        case .snackbar: SnackbarComponentUIViewController()
        case .snackbarPresentation: SnackbarPresentationComponentUIViewController()
        case .spinner: SpinnerComponentUIViewController()
        case .stepper: StepperComponentUIViewController()
        case .tab: TabComponentUIViewController()
        case .tag: TagComponentUIViewController()
        case .textEditor: TextEditorComponentUIViewController()
        case .textField: TextFieldComponentUIViewController()
        case .textFieldAddons: TextFieldAddonsComponentUIViewController()
        case .textLink: TextLinkComponentUIViewController()
        case .toggle: ToggleComponentUIViewController()
        default: EmptyView()
        }
    }
}

// MARK: - Familly

extension ComponentsView {
    enum Familly: String, CaseIterable, Hashable {
        case all
        case action
        case dataDisplay
        case dataInput
        case indicator
        case navigation
        case other
        case overlays
        case style
    }
}

// MARK: - Familly

extension ComponentsView {
    enum AccessibilityStatus: String, CaseIterable, Hashable {
        case all
        case none
        case available
        case unavailable

        var isAccessibility: Bool {
            self != .none
        }

        var color: Color {
            switch self {
            case .all: .primary
            case .none: .gray
            case .available: .green
            case .unavailable: .red
            }
        }
    }
}

// MARK: - Components

extension ComponentsView {

    enum Component: String, CaseIterable, Hashable {
        case adaptativeStack
        case badge
        case border
        case borderRadius
        case bottomSheet
        case button
        case checkbox
        case checkboxGroup
        case chip
        case cornerRadius
        case divider
        case formField
        case icon
        case iconButton
        case microAnimation
        case popover
        case progressBar
        case progressBarIndeterminate
        case progressTracker
        case radioButton
        case radioGroup
        case ratingDisplay
        case ratingInput
        case segmentedGauge
        case slider
        case snackbar
        case snackbarPresentation
        case spinner
        case stepper
        case tab
        case tag
        case textEditor
        case textField
        case textFieldAddons
        case textLink
        case toggle

        // MARK: - Properties

        var familly: Familly {
            switch self {
            case .adaptativeStack: .style
            case .badge: .indicator
            case .border: .style
            case .borderRadius: .style
            case .bottomSheet: .overlays
            case .button: .action
            case .checkbox: .dataInput
            case .checkboxGroup: .dataInput
            case .chip: .dataInput
            case .cornerRadius: .style
            case .divider: .dataDisplay
            case .formField: .dataInput
            case .icon: .dataDisplay
            case .iconButton: .action
            case .microAnimation: .other
            case .popover: .overlays
            case .progressBar: .indicator
            case .progressBarIndeterminate: .indicator
            case .progressTracker: .indicator
            case .radioButton: .dataInput
            case .radioGroup: .dataInput
            case .ratingDisplay: .dataDisplay
            case .ratingInput: .dataInput
            case .segmentedGauge: .indicator
            case .slider: .dataInput
            case .snackbar: .overlays
            case .snackbarPresentation: .overlays
            case .spinner: .indicator
            case .stepper: .dataInput
            case .tab: .navigation
            case .tag: .dataDisplay
            case .textEditor: .dataInput
            case .textField: .dataInput
            case .textFieldAddons: .dataInput
            case .textLink: .action
            case .toggle: .dataInput
            }
        }

        var accessibilityStatus: AccessibilityStatus {
            switch self {
            case .adaptativeStack: .available
            case .badge: .available
            case .border: .available
            case .borderRadius: .available
            case .bottomSheet: .none
            case .button: .available
            case .checkbox: .available
            case .checkboxGroup: .available
            case .chip: .available
            case .cornerRadius: .available
            case .divider: .available
            case .formField: .available
            case .icon: .available
            case .iconButton: .available
            case .microAnimation: .none
            case .popover: .unavailable
            case .progressBar: .unavailable
            case .progressBarIndeterminate: .unavailable
            case .progressTracker: .unavailable
            case .radioButton: .available
            case .radioGroup: .available
            case .ratingDisplay: .unavailable
            case .ratingInput: .unavailable
            case .segmentedGauge: .available
            case .slider: .unavailable
            case .snackbar: .unavailable
            case .snackbarPresentation: .none
            case .spinner: .unavailable
            case .stepper: .available
            case .tab: .unavailable
            case .tag: .available
            case .textEditor: .available
            case .textField: .available
            case .textFieldAddons: .available
            case .textLink: .unavailable
            case .toggle: .available
            }
        }

        private var illustration: Image? {
            switch self {
            case .badge: .init(.badge)
            case .button: .init(.button)
            case .bottomSheet: .init(.bottomSheet)
            case .checkbox: .init(.checkbox)
            case .checkboxGroup: .init(.checkbox)
            case .chip: .init(.chip)
            case .divider: .init(.divider)
            case .formField: .init(.textField)
            case .icon: .init(.icon)
            case .iconButton: .init(.iconButton)
            case .popover: .init(.popover)
            case .progressBar: .init(.progressBar)
            case .progressBarIndeterminate: .init(.progressBar)
            case .progressTracker: .init(.progressTracker)
            case .radioButton: .init(.radioButton)
            case .radioGroup: .init(.radioButton)
            case .ratingDisplay: .init(.rating)
            case .ratingInput: .init(.rating)
            case .segmentedGauge: .init(.segmentedGauge)
            case .slider: .init(.slider)
            case .snackbar: .init(.snackbar)
            case .snackbarPresentation: .init(.snackbar)
            case .spinner: .init(.spinner)
            case .stepper: .init(.stepper)
            case .tab: .init(.tab)
            case .tag: .init(.tag)
            case .textEditor: .init(.textEditor)
            case .textField: .init(.textField)
            case .textFieldAddons: .init(.textField)
            case .textLink: .init(.textLink)
            case .toggle: .init(.toggle)
            default: nil
            }
        }

        @ViewBuilder
        var illustrationView: some View {
            switch self {
            case .adaptativeStack: AdaptativeStackIllustrationView()
            case .border: BorderIllustrationView()
            case .borderRadius: BorderRadiusIllustrationView()
            case .cornerRadius: CornerRadiusIllustrationView()
            case .microAnimation: MicroAnimationllustrationView()
            default:
                ZStack {
                    if let illustration {
                        illustration
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Image(.placeholder)
                            .resizable()
                            .aspectRatio(contentMode: .fit)

                        Text(self.name.acronym)
                            .font(.system(size: 50))
                            .foregroundStyle(Color.level1)
                            .bold()
                    }
                }
            }
        }

        static func allCases(
            for framework: Framework,
            familly: Familly,
            accessibilityStatus: AccessibilityStatus?
        ) -> [Self] {
            var values: [Self]

            switch framework {
            case .uiKit:
                values = self.allCases.filter {
                    $0 != .border
                }
            case .swiftUI:
                values = self.allCases.filter {
                    $0 != .textFieldAddons
                }
            }

            return values.filter {
                familly == .all || $0.familly == familly
            }
            .filter {
                accessibilityStatus == .all || $0.accessibilityStatus == accessibilityStatus
            }
            .filter {
                accessibilityStatus == .all || $0.accessibilityStatus == accessibilityStatus
            }
        }
    }
}

#Preview {
    ComponentsView(framework: .swiftUI)
}
