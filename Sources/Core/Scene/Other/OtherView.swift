//
//  OtherView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct OtherView: View {

    // MARK: - Enum

    private enum RedirectionSection: String, CaseIterable, Hashable {
        case theme
        case devMode

        var redirections: [Redirection] {
            switch self {
            case .theme: [.theme]
            case .devMode: [
                .devModeSwiftUI,
                .devModeUIKit
            ]
            }
        }
    }

    private enum Redirection: String, CaseIterable, Hashable {
        case theme
        case devModeSwiftUI
        case devModeUIKit

        var name: String {
            switch self {
            case .theme: "Theme"
            case .devModeSwiftUI: "SwiftUI"
            case .devModeUIKit: "UIKit"
            }
        }
    }

    // MARK: - Properties

    private var appVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    private var buildNumber: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }

    // MARK: - View

    var body: some View {
        NavigationStack {
            List {
                ForEach(RedirectionSection.allCases, id: \.self) { section in
                    Section(section.name) {
                        ForEach(section.redirections, id: \.self) { redirection in
                            NavigationLink(redirection.name, value: redirection)
                        }
                    }
                }

                if let appVersion {
                    Section {
                        HStack {
                            Text("App Version")

                            Spacer()

                            HStack(spacing: 2) {
                                Text(appVersion)
                                if let buildNumber {
                                    Text("(\(buildNumber))")
                                }
                            }
                            .bold()
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                }
            }
            .navigationDestination(for: Redirection.self, destination: { redirection in
                switch redirection {
                case .theme:
                    ThemeView()
                        .navigationBarTitle(RedirectionSection.theme.name)
                case .devModeSwiftUI:
                    DevModeView()
                        .navigationBarTitle(RedirectionSection.devMode.name)
                case .devModeUIKit:
                    DevModeUIViewRepresentable()
                        .navigationBarTitle(RedirectionSection.devMode.name)
                }
            })
            .navigationBarTitle("Other")
        }
    }
}

#Preview {
    OtherView()
}
