//
//  BottomSheetCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct BottomSheetCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.simple),
            .init(title: "Full", code: Self.full)
        ]
    }()

    // MARK: - Private Properties

    private static var simple: String {
        """
        import SwiftUI

        struct ContentView: View {
            @State private var isPresented = false

            var body: some View {
                Button("Show Bottom Sheet") {
                    isPresented = true
                }
                .sheet(isPresented: $isPresented) {
                    VStack(spacing: 16) {
                        Text("Bottom Sheet")
                            .font(.title)

                        Text("This is a simple bottom sheet example.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()

                        Button("Dismiss") {
                            isPresented = false
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.top, 24)
                    .presentationDetents([.medium])
                }
            }
        }
        """
    }

    private static var full: String {
        """
        import SwiftUI

        struct ContentView: View {
            @State private var isPresented = false
            @State private var height: CGFloat = 100

            var body: some View {
                Button("Show Bottom Sheet") {
                    isPresented = true
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isPresented) {
                    // With ScrollView for long content
                    ScrollView {
                        presentedView()
                    }
                    .scrollIndicators(.visible)
                    .presentationDetents([.medium, .large])

                    // OR with dynamic height for short content
                    // presentedView()
                    //     .readHeight($height)
                    //     .presentationDetents([.height(height), .medium])
                }
            }

            private func presentedView() -> some View {
                VStack(spacing: 24) {
                    VStack(spacing: 16) {
                        Text("Bottom Sheet")
                            .font(.title)

                        Text("Content Type Description")
                            .font(.title3)
                    }

                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()

                    Button {
                        isPresented = false
                    } label: {
                        Text("Dismiss")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.top, 24)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        """
    }
}
