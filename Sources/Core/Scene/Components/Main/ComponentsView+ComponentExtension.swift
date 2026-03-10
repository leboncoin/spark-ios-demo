//
//  ComponentsView+ComponentExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 19/01/2026.
//

import SwiftUI

extension ComponentsView {

    enum Component: String, CaseIterable, Hashable {
        case adaptativeStack
        case badge
        case border
        case borderRadius
        case bottomSheet
        case button
        case card
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
            case .card: .dataDisplay
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
            case .card: .available
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
            case .progressBar: .available
            case .progressBarIndeterminate: .available
            case .progressTracker: .unavailable
            case .radioButton: .available
            case .radioGroup: .available
            case .ratingDisplay: .available
            case .ratingInput: .available
            case .segmentedGauge: .available
            case .slider: .available
            case .snackbar: .unavailable
            case .snackbarPresentation: .none
            case .spinner: .available
            case .stepper: .available
            case .tab: .available
            case .tag: .available
            case .textEditor: .available
            case .textField: .available
            case .textFieldAddons: .available
            case .textLink: .available
            case .toggle: .available
            }
        }

        private var illustration: Image? {
            switch self {
            case .badge: .init(.badge)
            case .button: .init(.button)
            case .bottomSheet: .init(.bottomSheet)
            case .card: .init(.card)
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

        @ViewBuilder
        var swiftUIComponent: some View {
            switch self {
            case .adaptativeStack: AdaptativeStackComponentView()
            case .badge: BadgeComponentView()
            case .border: BorderComponentView()
            case .borderRadius: BorderRadiusComponentView()
            case .bottomSheet: BottomSheetComponentView()
            case .button: ButtonComponentView()
            case .card: CardComponentView()
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

        @ViewBuilder
        var uiKitComponent: some View {
            switch self {
            case .adaptativeStack: AdaptativeStackComponentUIViewController()
            case .badge: BadgeComponentUIViewController()
            case .borderRadius: BorderRadiusComponentUIViewController()
            case .button: ButtonComponentUIViewController()
            case .bottomSheet: BottomSheetComponentUIViewController()
            case .card: CardComponentUIViewController()
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

        // MARK: - Static Properties

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
