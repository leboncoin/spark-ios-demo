//
//  DropShadowView.swift
//  SparkDemo
//
//  Created by louis.borlee on 30/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct DropShadowView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    @ObservedObject private var viewModel = DropShadowViewModel()

    // MARK: - View

    var body: some View {
        ForEach(viewModel.itemViewModels, id: \.id) { itemViewModel in
            DropShadowItemView(
                itemViewModel: itemViewModel,
                backgroundColor: self.theme.value.colors.main.main.color
            )
            .listRowBackground(self.theme.value.colors.base.surface.color)
        }
        .onChange(of: self.theme, initial: true) {
            self.viewModel.theme = self.theme.value
        }
    }
}

struct DropShadowItemView: View {

    let itemViewModel: DropShadowItemViewModel
    let backgroundColor: Color

    var body: some View {
        VStack(alignment: .leading) {
            Text(itemViewModel.name)
            Text(itemViewModel.description)
                .font(Font.caption2)
                .italic()
                .foregroundColor(.gray)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            self.backgroundColor
                .frame(height: 50)
                .cornerRadius(5)
                .shadow(itemViewModel.shadow)
        }
        .padding(.bottom)
    }
}
