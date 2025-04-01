//
//  DemoApp.swift
//  SparkDemo
//
//  Created by robin.lemaire on 14/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_exported import SparkDemo

@main
struct DemoApp: App {

    // MARK: - Initialization

    init() {
        // Configuration
        SparkConfiguration.load()
    }

    // MARK: - View

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
