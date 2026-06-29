//
//  ColorSectionType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 13/03/2023.
//

enum ColorSectionType: CaseIterable {
    case accent
    case ai
    case base
    case feedback
    case main
    case states
    case support

    // MARK: - Properties

    func viewModel() -> any ColorSectionViewModelable {
        let colors = DemoThemes.shared.mainTheme.value.colors
        return switch self {
        case .accent: ColorSectionAccentViewModel(color: colors.accent)
        case .ai: ColorSectionAIViewModel(color: colors.ai)
        case .base: ColorSectionBaseViewModel(color: colors.base)
        case .feedback: ColorSectionFeedbackViewModel(color: colors.feedback)
        case .main: ColorSectionMainViewModel(color: colors.main)
        case .states: ColorSectionStatesViewModel(color: colors.states)
        case .support: ColorSectionSupportViewModel(color: colors.support)
        }
    }
}
