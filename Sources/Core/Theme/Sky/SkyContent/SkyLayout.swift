//
//  SkyLayout.swift
//  Spark
//
//  Created by robin.lemaire on 22/08/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

struct SkyLayout: Layout {

    // MARK: - Properties

    let spacing: any LayoutSpacing = LayoutSpacingDefault(
        small: 2,
        medium: 5,
        large: 14,
        xLarge: 19,
        xxLarge: 27,
        xxxLarge: 35
    )
}
