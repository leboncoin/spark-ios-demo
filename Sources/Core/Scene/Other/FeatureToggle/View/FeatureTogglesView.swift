//
//  FeatureTogglesView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 06/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct FeatureTogglesView: View {

    // MARK: - Properties

    @ObservedObject private var featureToggle = FeatureToggle()

    // MARK: - Enum

    private enum Properties: String, CaseIterable, Hashable {
        case rebranding
    }

    // MARK: - View

    var body: some View {
        List {
            ForEach(Properties.allCases, id: \.self) { property in
                Button {
                    switch property {
                    case .rebranding:
                        self.featureToggle.rebranding.toggle()
                    }

                } label: {

                    let value = switch property {
                    case .rebranding: self.featureToggle.rebranding
                    }

                    HStack {
                        Text(property.name)
                            .foregroundColor(.primary)

                        Spacer()

                        if value {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FeatureTogglesView()
}
