//
//  BorderRadiusComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias BorderRadiusComponentView = ComponentViewable<BorderRadiusConfiguration, BorderRadiusImplementationView, BorderRadiusConfigurationView>

extension BorderRadiusComponentView {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - Subview

struct BorderRadiusImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<BorderRadiusConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        Rectangle()
            .fill(self.configurationWrapped.backgroundColor.color)
            .frame(height: self.configurationWrapped.contentSize.height)
            .fixedSize(horizontal: false, vertical: true)
            .sparkBorder(
                width: self.configurationWrapped.width.value(from: self.configurationWrapped),
                radius: self.configurationWrapped.radius.value(from: self.configurationWrapped),
                dash: self.configurationWrapped.dash,
                isHighlighted: self.configurationWrapped.isHighlighted,
                colorToken: self.configurationWrapped.borderColor,
                position: self.configurationWrapped.position,
                isScaled: self.configurationWrapped.swiftUIIsScaled
            )
    }
}

// MARK: - Preview

struct BorderRadiusComponentView_Previews: PreviewProvider {
    static var previews: some View {
        BorderRadiusComponentView()
    }
}
