//
//  ColorSectionType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 13/03/2023.
//

enum ColorSectionType: CaseIterable {
    case main
    case support
    case accent
    case base
    case feedback
    case states
    case ia

    // MARK: - Properties

    func viewModel() -> any ColorSectionViewModelable {
        let colors = DemoThemes.shared.mainTheme.value.colors
        return switch self {
        case .main: ColorSectionMainViewModel(color: colors.main)
        case .support: ColorSectionSupportViewModel(color: colors.support)
        case .accent: ColorSectionAccentViewModel(color: colors.accent)
        case .base: ColorSectionBaseViewModel(color: colors.base)
        case .feedback: ColorSectionFeedbackViewModel(color: colors.feedback)
        case .states: ColorSectionStatesViewModel(color: colors.states)
        case .ia: ColorSectionIAViewModel(color: colors.ia)
        }
    }
}
