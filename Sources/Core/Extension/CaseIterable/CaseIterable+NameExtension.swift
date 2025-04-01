//
//  CaseIterable+NameExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 15/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension CaseIterable {
    var name: String {
        "\(self)".addSpacesBeforeCapitalLetter.capitalized
    }
}
