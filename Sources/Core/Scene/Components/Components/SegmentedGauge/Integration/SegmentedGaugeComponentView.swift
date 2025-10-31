//
//  SegmentedGaugeComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 31/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias SegmentedGaugeComponentView = ComponentViewable<SegmentedGaugeConfiguration, SegmentedGaugeImplementationView, SegmentedGaugeConfigurationView>

// MARK: - Subview

struct SegmentedGaugeImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SegmentedGaugeConfiguration>

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .sparkSegmentedGaugeAlignment(self.configurationWrapped.alignement)
            .sparkSegmentedGaugeSegments(self.configurationWrapped.segments)
            .sparkSegmentedGaugeSize(self.configurationWrapped.size)
            .sparkSegmentedGaugeIsMarker(self.configurationWrapped.isMarker)
            .demoSegmentedGaugeType(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
    }

    @ViewBuilder
    func component() -> some View {

        // TODO: Gerer quand un des deux label est custom et l'autre en string

        if self.configurationWrapped.swiftUIIsCustomTitle,
           self.configurationWrapped.swiftUIIsCustomDescription {
            SparkSegmentedGauge(
                titleLabel: {
                    self.customContent(forTitle: true)
                },
                descriptionLabel: {
                    self.customContent(forTitle: false)
                }
            )

        } else if self.configurationWrapped.swiftUIIsCustomDescription {
            SparkSegmentedGauge(
                descriptionLabel: {
                    self.customContent(forTitle: false)
                }
            )

        } else if let title = self.configurationWrapped.title.nilIfEmpty,
                  let description = self.configurationWrapped.description.nilIfEmpty {
            SparkSegmentedGauge(
                title: title,
                description: description
            )

        } else if let description = self.configurationWrapped.description.nilIfEmpty {
            SparkSegmentedGauge(
                description: description
            )
        } else {
            SparkSegmentedGauge(
                description: "Description"
            )
        }
    }

    // MARK: - Custom Content

    func customContent(forTitle: Bool) -> some View {
        HStack {
            Text(forTitle ? self.configurationWrapped.title : self.configurationWrapped.description)

            Text(forTitle ? self.configurationWrapped.swiftUICustomTitle : self.configurationWrapped.swiftUICustomDescription)
                .font(.footnote)
                .foregroundStyle(.blue)
        }
    }
}

// MARK: - Extension

private extension View {

    func demoSegmentedGaugeType(_ configuration: SegmentedGaugeConfiguration) -> some View {
        self.sparkSegmentedGaugeType(configuration.type.toRealType(configuration))
    }
}

// MARK: - Preview

struct SegmentedGaugeComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedGaugeComponentView()
    }
}
