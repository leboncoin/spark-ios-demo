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
        case appearance
        case rebranding
        case visualIdentification

        var description: String {
            return switch self {
            case .appearance: "Replace some properties on components (Intent, variant, ...) to the new appearance property."
            case .rebranding: "Use the rebranded tokens/components/...."
            case .visualIdentification: "Apply a colored background on Spark components (the colors differ between UIKit and SwiftUI)."
            }
        }
    }

    // MARK: - View

    var body: some View {
        List {
            ForEach(Properties.allCases, id: \.self) { property in
                Button {
                    switch property {
                    case .appearance:
                        self.featureToggle.appearance.toggle()
                    case .rebranding:
                        self.featureToggle.rebranding.toggle()
                    case .visualIdentification:
                        self.featureToggle.visualIdentification.toggle()
                    }

                } label: {

                    let value = switch property {
                    case .appearance: self.featureToggle.appearance
                    case .rebranding: self.featureToggle.rebranding
                    case .visualIdentification: self.featureToggle.visualIdentification
                    }

                    VStack(alignment: .leading, spacing: .xSmall) {
                        HStack {
                            Text(property.name)
                                .foregroundColor(.primary)

                            Spacer()

                            if value {
                                Image(systemName: "checkmark")
                            }
                        }

                        Text(property.description)
                            .foregroundColor(.gray)
                            .italic()
                    }

                }
            }
        }
    }
}

#Preview {
    FeatureTogglesView()
}
