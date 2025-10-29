//
//  MicroAnimationllustrationView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct MicroAnimationllustrationView: View {

    // MARK: - View

    var body: some View {
        Image(.bellOutline)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .foregroundStyle(Color.level1)
            .animate(type: .bell, repeat: .unlimited)
            .illustrationStyle()
    }
}

#Preview {
    MicroAnimationllustrationView()
}
