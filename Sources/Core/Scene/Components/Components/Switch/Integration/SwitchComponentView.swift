//
//  SwitchComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SwitchComponentView = ComponentViewable<SwitchConfiguration, SwitchImplementationView, SwitchConfigurationView>

extension SwitchComponentView {

    init() {
        self.init(style: .alone, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct SwitchImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SwitchConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        self.component()
            .demoAccessibilityLabel(self.configurationWrapped)
            .demoDisabled(self.configurationWrapped)
            .demoFrame(self.configurationWrapped)
    }

    @ViewBuilder
    func component() -> some View {
        if self.configurationWrapped.swiftUIIsCustomContent {
            SparkToggle(
                theme: self.configurationWrapped.theme.value,
                isOn: self.$isOn,
                onIcon: .init(icon: Iconography.check),
                offIcon: .init(icon: Iconography.cross),
                label: {
                    VStack(alignment: .leading) {
                        Text(self.configurationWrapped.text)
                            .font(.body)
                            .foregroundStyle(.orange)
                        Text(self.configurationWrapped.swiftUISecondText)
                            .font(.footnote)
                            .foregroundStyle(.blue)
                    }
                }
            )
        } else if let text = configurationWrapped.text.nilIfEmpty {
            SparkToggle(
                text,
                theme: self.configurationWrapped.theme.value,
                isOn: self.$isOn,
                onIcon: .init(icon: Iconography.check),
                offIcon: .init(icon: Iconography.cross)
            )
        } else {
            SparkToggle(
                theme: self.configurationWrapped.theme.value,
                isOn: self.$isOn,
                onIcon: .init(icon: Iconography.check),
                offIcon: .init(icon: Iconography.cross)
            )
        }
    }
}

// MARK: - Preview

struct SwitchComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchComponentView()
    }
}
