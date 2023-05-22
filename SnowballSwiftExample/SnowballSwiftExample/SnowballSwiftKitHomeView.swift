//
//  SnowballSwiftKitHomeView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftKitHomeView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Text") {
                    SnowballSwiftExampleText()
                        .navigationTitle("Text")
                }
                
                NavigationLink("Buttons") {
                    SnowballSwiftExampleButtonsView()
                        .navigationTitle("Buttons")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Snowball Example")
        }
    }
}

struct SnowballSwiftKitHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftKitHomeView()
    }
}
