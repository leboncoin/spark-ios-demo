//
//  ColorItemView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct ColorItemView: View {

    // MARK: - Properties

    let viewModel: ColorItemViewModel

    // MARK: - View

    var body: some View {
        ZStack {
            self.viewModel.color
                .frame(height: 60)

                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            Text(self.viewModel.name)
                .foregroundColor(self.viewModel.foregroundColor)
        }
    }
}
