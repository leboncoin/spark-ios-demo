//
//  SkyTheme.swift
//  Spark
//
//  Created by alex.vecherov on 01.06.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

public struct SkyTheme: Theme {

    // MARK: - Properties

    public init() {}

    public static let shared = Self()

    public let border: any Border = SkyBorder()
    public let colors: any Colors = SkyColors()
    public let elevation: any Elevation = SkyElevation()
    public let layout: any Layout = SkyLayout()
    public let typography: any Typography = SparkTypography()
    public let dims: any Dims = SkyDims()
}
