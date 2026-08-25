//
//  ColorView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct ColorView: View {

    // MARK: - Properties

    private let viewModel = ColorViewModel()

    // MARK: - View

    var body: some View {
        List(self.viewModel.sectionViewModels(), id: \.name) { sectionViewModel in
            NavigationLink(sectionViewModel.name) {
                ColorSectionView(viewModel: sectionViewModel)
            }
        }
        .navigationBarTitle("Color")
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
