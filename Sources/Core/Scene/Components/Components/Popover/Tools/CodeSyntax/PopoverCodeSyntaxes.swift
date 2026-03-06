//
//  PopoverCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct PopoverCodeSyntaxes {

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
        @State private var isPresented: Bool = false

        Button("Show popover") {
            isPresented = true
        }
        .popover(
            theme: theme,
            intent: .main,
            isPresented: $isPresented
        ) { colors in
            Text("This is a popover")
                .foregroundStyle(colors.foreground.color)
        }
        """
    }

    private static var full: String {
        """
        @State private var isPresented: Bool = false

        Button("Show popover") {
            isPresented = true
        }
        .popover(
            theme: theme,
            intent: .success,
            isPresented: $isPresented,
            attachmentAnchor: .rect(.bounds),
            arrowEdge: .top
        ) { colors in
            VStack(alignment: .leading, spacing: 8) {
                Text("Popover Title")
                    .font(.headline)
                    .foregroundStyle(colors.foreground.color)

                Text("This is a comprehensive example showing all major features of the Popover component. You can customize the intent, attachment anchor, and arrow edge.")
                    .font(.body)
                    .foregroundStyle(colors.foreground.color)
                    .frame(maxWidth: 300)
            }
            .padding()
        }
        """
    }
}
