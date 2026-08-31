//
//  ElevationView.swift
//  SparkDemo
//
//  Created by louis.borlee on 30/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct ElevationView: View {

    // MARK: - View

    var body: some View {
        List {
            Section(header: Text("Drop Shadow")) {
                DropShadowView()
            }
        }
        .navigationTitle("Elevation")
    }
}
