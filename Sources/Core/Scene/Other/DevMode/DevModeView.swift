//
//  DevModeView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon


struct DevModeView: View {

    // MARK: - Properties

    var theme = DemoThemes.shared.mainTheme
    @State private var volume: Int = 0
    @State private var volume2: Int = 100
    @State private var value: Bool = false

    private var rbconfiguration = RadioGroupConfiguration()
    @State private var selectedID: Int?

    // MARK: - View

    var body: some View {
        VStack(spacing: 30) {
            Text("Replace me with your UI content")

            Text("Replace me with your UI content")
                .background(.purple)

            Text("Replace me with your UI content")
                .background(.blue)

            Button("Toggle") {
                self.value = true
                self.volume = self.volume + 1
            }

            Com(test: volume, bound: volume...volume2)

//            ScrollView {
//                LazyVStack {
//                    ForEach((0..<20)) { index in
//                        SparkCard {
//                            VStack(alignment: .leading, spacing: .medium) {
//                                TagImplementationView(configuration: .constant(.init()))
//
//                                VStack(alignment: .leading, spacing: .small) {
//                                    HStack {
//                                        IconImplementationView(configuration: .constant(.init()))
//
//                                        Text("Welcome on Card")
//                                    }
//
//                                    Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus.")
//                                        .multilineTextAlignment(.leading)
//                                        .truncationMode(.middle)
//                                }
//
//                                ButtonImplementationView(configuration: .constant(.init()))
//                            }
//                            .padding(0)
//                        }
//                    }
//                }
//            }
//            .sparkTheme(self.theme.value)
//            .sparkCardIntent(.error)
//            .sparkCardIsPadding(false)
        }
        .sheet(isPresented: self.$value, content: {


            SparkRadioGroup(
                selectedID: self.$selectedID,
                items: self.rbconfiguration.items.map { item in
                    RadioGroupItem(
                        id: item.id,
                        isEnabled: item.isEnabled,
                        label: {
                            VStack(alignment: .leading) {
                                Text(item.getText())
                                    .foregroundStyle(.orange)
                                Text(item.swiftUISecondText)
                                    .font(.footnote)
                                    .foregroundStyle(.blue)
                            }
                        }
                    )
                }
            )
            .sparkRadioButtonIsAnimated(false)
            .sparkTheme(self.theme.value)

        })
        .onChange(of: self.selectedID) { value in
            self.value = false
        }
    }
}

#Preview {
    DevModeView()
}


struct Com: View {

    let test: Int
    let bound: ClosedRange<Int>

    var body: some View {
        Text("Hello")
            .onAppear() {
                print("LOGROB Appear \(test) - \(bound)")
            }
            .onChange(of: test) { value in
                    print("LOGROB test changed \(value)")
            }
            .onChange(of: bound) { value in
                    print("LOGROB bound changed \(value)")
            }
    }
}
