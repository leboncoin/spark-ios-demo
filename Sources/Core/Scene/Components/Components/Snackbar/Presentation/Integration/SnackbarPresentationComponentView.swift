//
//  SnackbarPresentationComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// TODO: To fix :
// not working when .snackbar is on child view

// MARK: - View

typealias SnackbarPresentationComponentView = ComponentViewable<SnackbarPresentationConfiguration, SnackbarPresentationImplementationView, SnackbarPresentationConfigurationView, SnackbarExtraTools>

extension SnackbarPresentationComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct SnackbarPresentationImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SnackbarPresentationConfiguration>

    @State private var isPresented: Bool = false

    // MARK: - View

    var body: some View {
        Button(action: {
            self.isPresented = true
        }, label: {
            Text("Show snackbar")
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .sparkSnackbar(
            isPresented: self.$isPresented,
            autoDismissDelay: self.configurationWrapped.autoDismissDelay,
            snackbar: {
                
                SparkSnackbar(
                    title: "Title",
                    description: "Snackbar placeholder"
                ) {
                    SparkButton("Action") {
                        self.isPresented = false
                    }
                }
                .frame(maxWidth: 600)
            }
        )
        .sparkTheme(self.configurationWrapped.theme.value)
    }
}

// MARK: - Preview

struct SnackbarPresentationComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SnackbarPresentationComponentView()
    }
}
