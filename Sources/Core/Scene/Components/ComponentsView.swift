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
    @State private var familly: Familly = .all
    @State private var searchText = ""

    var searchResults: [Component] {
        let allCases = Component.allCases(
            for: self.framework,
            familly: self.familly
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
                            VStack(alignment: .leading) {
                                Text(component.name)
                                    .font(.body)
                                Text(component.familly.name)
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                                    .italic()
                            }
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

        static func allCases(for framework: Framework, familly: Familly) -> [Self] {
            let values: [Self]

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
        }
    }
}

#Preview {
    ComponentsView(framework: .swiftUI)
}
