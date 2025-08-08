//
//  CornerRadiusComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CornerRadiusComponentView = ComponentViewable<CornerRadiusConfiguration, CornerRadiusImplementationView, CornerRadiusConfigurationView>

extension CornerRadiusComponentView {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - Subview

struct CornerRadiusImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CornerRadiusConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        VStack {
            Rectangle()
                .fill(self.configurationWrapped.backgroundColor.color)
                .sparkCornerRadius(
                    self.configurationWrapped.radius.value(from: self.configurationWrapped),
                    isHighlighted: self.configurationWrapped.isHighlighted,
                    isScaled: self.configurationWrapped.swiftUIIsScaled
                )
                .frame(height: 20)
                .fixedSize(horizontal: false, vertical: true)

            Rectangle()
                .fill(self.configurationWrapped.backgroundColor.color)
                .sparkBorder(
                    width: 2,
                    radius: self.configurationWrapped.radius.value(from: self.configurationWrapped),
                    isHighlighted: self.configurationWrapped.isHighlighted,
                    colorToken: self.configurationWrapped.theme.value.colors.support.support,
                    isScaled: self.configurationWrapped.swiftUIIsScaled
                )
                .frame(height: 20)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

// MARK: - Preview

struct CornerRadiusComponentView_Previews: PreviewProvider {
    static var previews: some View {
        CornerRadiusComponentView()
    }
}
