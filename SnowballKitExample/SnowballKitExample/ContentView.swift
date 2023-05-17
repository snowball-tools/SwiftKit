//
//  ContentView.swift
//  SnowballKitExample
//
//  Created by Vivian Phung on 5/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Button") {
                    ButtonExampleView()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Snowball Kit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
