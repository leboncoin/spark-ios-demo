//
//  MicroAnimationCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct MicroAnimationCodeSyntaxes {

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
        @State private var isPlayed: Bool = false

        IconView(icon: .bellOutline)
            .animate(
                type: .bell,
                play: isPlayed
            ) {
                isPlayed = false
            }
        """
    }

    private static var full: String {
        """
        @State private var isPlayed: Bool = false

        VStack(spacing: 20) {
            // Icon with bell animation
            IconView(icon: .bellOutline)
                .animate(
                    type: .bell,
                    play: isPlayed,
                    repeat: .limited(3)
                ) {
                    isPlayed = false
                }

            // Icon button with bell animation
            IconButtonView(
                icon: .bellOutline,
                intent: .main,
                variant: .filled,
                size: .medium
            )
            .animate(
                type: .bell,
                play: isPlayed,
                repeat: .unlimited
            ) {
                isPlayed = false
            }

            // Control button
            Button("Start Animation") {
                isPlayed.toggle()
            }
            .disabled(isPlayed)
        }
        """
    }
}
