//
//  DevModeView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon


struct DevModeView: View {

    // MARK: - Properties

    var theme = DemoThemes.shared.mainTheme

    // MARK: - View

    var body: some View {
        Text("Replace me with your UI content")

        ZStack {
            Image.sparkStarOutline
                .resizable()
                .foregroundStyle(.gray)

            Image.sparkStarFill
                .resizable()
                .foregroundStyle(.orange)
                .mask(
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: geo.size.width * min(max(0.5, 0), 1))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
        }
        .frame(size: 50)
    }
}

#Preview {
    DevModeView()
}
