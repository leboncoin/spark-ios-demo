//
//  SnackbarComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SnackbarComponentView = ComponentViewable<SnackbarConfiguration, SnackbarImplementationView, SnackbarConfigurationView, SnackbarExtraTools>

extension SnackbarComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct SnackbarImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SnackbarConfiguration>

    @State private var isShowingAlert: Bool = false

    // MARK: - View

    var body: some View {
        self.component {
            self.isShowingAlert = true
        }
        .sparkTheme(self.configurationWrapped.theme.value)
        .sparkSnackbarIntent(self.configurationWrapped.intent)
        .sparkSnackbarAlignment(self.configurationWrapped.alignment)
        .demoAccessibilityLabel(self.configurationWrapped)
        .alert("Button tap", isPresented: self.$isShowingAlert) {
            Button("OK", role: .cancel) { }
        }
    }

    @ViewBuilder
    private func component(action: @escaping @MainActor () -> Void) -> some View {
        let icon = Image(icon: self.configurationWrapped.icon)
        let title = self.configurationWrapped.title.nilIfEmpty
        let message = self.configurationWrapped.message.nilIfEmpty
        let hasButton = self.configurationWrapped.hasButton

        let isCustomContent = self.configurationWrapped.swiftUIIsCustomContent

        switch (isCustomContent, hasButton) {
        // Custom content + button
        case (true, true):
            self.makeSnackbarWithButton(
                icon: icon,
                action: action
            ) {
                self.makeCustomTitle(title)
            } descriptionLabel: {
                self.makeCustomMessage(message)
            }

        // Custom content
        case (true, false):
            self.makeSnackbar(
                icon: icon
            ) {
                self.makeCustomTitle(title)
            } descriptionLabel: {
                self.makeCustomMessage(message)
            }

        // Button only
        case (false, true):
            self.makeSnackbarWithButton(
                icon: icon,
                action: action
            ) {
                self.makeTitle(title)
            } descriptionLabel: {
                self.makeMessage(message)
            }

        // Default
        case (false, false):
            self.makeSnackbar(
                icon: icon
            ) {
                self.makeTitle(title)
            } descriptionLabel: {
                self.makeMessage(message)
            }
        }
    }

    @ViewBuilder
    private func makeSnackbar<TitleLabel: View, DescriptionLabel: View>(
        icon: Image?,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) -> some View {
        SparkSnackbar(
            icon,
            titleLabel: titleLabel,
            descriptionLabel: descriptionLabel
        )
    }

    @ViewBuilder
    private func makeSnackbarWithButton<TitleLabel: View, DescriptionLabel: View>(
        icon: Image?,
        action: @escaping @MainActor () -> Void,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel
    ) -> some View {
        SparkSnackbar(
            icon,
            titleLabel: titleLabel,
            descriptionLabel: descriptionLabel
        ) {
            SparkButton(
                self.configurationWrapped.buttonTitle,
                action: action
            )
        }
    }

    @ViewBuilder
    private func makeTitle(_ title: String?) -> some View {
        if let title {
            Text(title)
        }
    }

    @ViewBuilder
    private func makeMessage(_ message: String?) -> some View {
        if let message {
            Text(message)
        }
    }

    private func makeCustomTitle(_ title: String?) -> some View {
        HStack {
            if let title {
                Text(title)
            }
            Text(self.configurationWrapped.swiftUISecondTitleText)
                .font(.footnote)
                .foregroundStyle(.blue)
        }
    }

    private func makeCustomMessage(_ message: String?) -> some View {
        HStack {
            if let message {
                Text(message)
            }
            Text(self.configurationWrapped.swiftUISecondMessageText)
                .font(.caption)
                .foregroundStyle(.green)
        }
    }
}

// MARK: - Preview

struct SnackbarComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SnackbarComponentView()
    }
}
